package com.bitheads.braincloud.comms
{
    import com.adobe.crypto.*;
    import com.bitheads.braincloud.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    
    public class BrainCloudComms
    {
        private static const NO_PACKET_EXPECTED:int = -1;
        
        private var _maxBundleSize:int = 10;
        private var _sessionId:String;
        private var _profileId:String;
        private var _isAuthenticated:Boolean;
        
        private var _packetId:int;
        private var _expectedIncomingPacketId:int;
        private var _fnDebugOutput:Function;
        private var _fnErrorOutput:Function;
        
        private var _url:String;
        private var _secret:String;
        private var _secretMap:Dictionary;
        private var _appId:String;
        
        private var _client:BrainCloudClient;
        
        private var _loader:URLLoader;
        private var _urlRequest:URLRequest;
        
        private var _serviceCallsWaiting:Array;
        private var _serviceCallsInProgress:Array;
        private var _responses:Array;
        private var _eventResponses:Array;
        
        //timeout/retry
        private var _packetTimeouts:Array = [10, 10, 10];
        private var _authPacketTimeoutSecs:uint = 15;
        
        private var _isAuthenticating:Boolean;
        private var _retryCount:uint;
        
        private var _heartbeatTimer:Timer;
        private var _timeoutTimer:Timer;
        private var _idleTimeout:uint;
        private var _desiredIdleTimeout:uint = 0;
        
        private var _loggingEnabled:Boolean = true;
        
        //callbacks
        private var _eventCallback:Function;
        private var _globalErrorCallback:Function;
        private var _networkErrorCallback:Function;
        
        //retry
        private var _cacheMessagesOnNetworkError:Boolean = false;
        private var _blockingQueue:Boolean = false;
        
        //For handling local session errors
        private var _cachedStatusCode:int;
        private var _cachedReasonCode:int;
        private var _cachedStatusMessage:String;
        
        //kill switch
        private var _killSwitchThreshold:int = 11;
        private var _killSwitchEngaged:Boolean;
        private var _killSwitchErrorCount:int;
        private var _killSwitchService:String;
        private var _killSwitchOperation:String;
        
        public function get isAuthenticated():Boolean
        {
            return _isAuthenticated;
        }
        
        public function setAuthenticated():void
        {
            _isAuthenticated = true;
        }
        
        public function get packetTimeouts():Array
        {
            return _packetTimeouts;
        }
        
        public function set packetTimeouts(timeouts:Array):void
        {
            _packetTimeouts = timeouts;
        }
        
        public function setGlobalErrorCallback(callback:Function):void
        {
            _globalErrorCallback = callback;
        }
        
        public function setEventCallback(callback:Function):void
        {
            _eventCallback = callback;
        }
        
        public function setNetworkErrorCallback(callback:Function):void
        {
            _networkErrorCallback = callback;
        }
        
        public function BrainCloudComms(client:BrainCloudClient)
        {
            _client = client;
            
            // avoid newing/nulling these through the lifetime of the game... less GC cycles
            _serviceCallsWaiting = [];
            _serviceCallsInProgress = [];
            _responses = [];
            _eventResponses = [];
            
            _heartbeatTimer = new Timer(60000);
            _heartbeatTimer.addEventListener(TimerEvent.TIMER, onHeartbeat);
            
            _fnDebugOutput = trace;
            _fnErrorOutput = trace;
            
            _urlRequest = new URLRequest();
            _urlRequest.method = URLRequestMethod.POST;
            _urlRequest.contentType = "application/json";
            
            resetErrorCache();
        }
        
        public function initialize(appId:String, secret:String, serverUrl:String):void
        {
            _appId = appId;
            _secret = secret;
            _url = serverUrl;

            //update the secretMap
            _secretMap = new Dictionary();
            _secretMap[appId] = secret;
        }
        
        public function initializeWithApps(appId:String, secretMap:Dictionary, serverUrl:String):void
        {
            //clear the dictionary
            for (var key:String in _secretMap)
            {
                delete _secretMap[key];
            }
            //update the secret
            _secretMap = secretMap;

            initialize(appId, _secretMap[appId], serverUrl);
        }

        public function getSessionId():String
        {
            return _sessionId;
        }
        
        public function setSessionId(sessionId:String):void
        {
            _sessionId = sessionId;
        }
        
        public function getUrl():String
        {
            return _url;
        }
        
        public function insertEndOfMessageBundleMarker():void
        {
            if (_serviceCallsWaiting.length > 0)
            {
                var call:ServerCall = _serviceCallsWaiting[0] as ServerCall;
                call.endOfBundleMarker = true;
            }
        }
        
        public function runCallbacks():void
        {
            if (_blockingQueue) return;
            
            //handle responses
            if (_responses.length > 0)
            {
                for each (var response:ServerResponse in _responses)
                {
                    processServiceResponse(response.serverCall, response.response);
                }
                _responses.length = 0;
            }
            
            if (_eventCallback != null && _eventResponses.length > 0)
            {
                _eventCallback(_eventResponses);
                _eventResponses.length = 0;
            }
            
            //send 
            if (_loader === null)
            {
                processQueue();
            }
        }
        
        public function resetCommunication():void
        {
            _sessionId = "";
            _isAuthenticated = false;
            _isAuthenticating = false;
            
            stopTimeoutTimer();
            releaseLoader();
            
            _serviceCallsWaiting.length = 0;
            _serviceCallsInProgress.length = 0;
            _responses.length = 0;
            _eventResponses.length = 0;
            _expectedIncomingPacketId = NO_PACKET_EXPECTED;
            
            _blockingQueue = false;
        }
        
        public function onHeartbeat(in_event:TimerEvent):void
        {
            if (!_isAuthenticated || _blockingQueue || _killSwitchEngaged) return;
            var serv:ServerCall = new ServerCall(ServiceName.HeartBeat, ServiceOperation.Read, null, null, null, null);
            sendRequest(serv);
        }
        
        public function sendRequest(serverCall:ServerCall):void
        {
            _serviceCallsWaiting.unshift(serverCall);
        }
        
        public function enableNetworkErrorMessageCaching(enabled:Boolean):void
        {
            _cacheMessagesOnNetworkError = enabled;
        }
        
        public function retryCachedMessages():void
        {
            if (!_blockingQueue) return;
            
            _fnDebugOutput("Retrying cached messages");
            
            _blockingQueue = false;
            _retryCount = 0;
            resendActivePacket();
        }
        
        public function flushCachedMessages(sendApiErrorCallbacks:Boolean):void
        {
            if (!_blockingQueue) return;
            
            _fnDebugOutput("Flushing cached messages");
            _blockingQueue = false;
            
            if (sendApiErrorCallbacks)
            {
                triggerCommsError(StatusCodes.CLIENT_NETWORK_ERROR, ReasonCodes.CLIENT_NETWORK_ERROR_TIMEOUT, "Timeout trying to reach brainCloud server");
            }
            else
            {
                releaseLoader();
                _serviceCallsInProgress.length = 0;
            }
        }
        
        private function processQueue():void
        {
            if (_serviceCallsWaiting.length > 0)
            {
                //stop heartbeat timer
                stopHeartbeatTimer();
                
                _isAuthenticating = false;
                _retryCount = 0;
                
                // set up request object        
                _urlRequest.url = _url;
                
                // sort
                for (var j:int = 0; j < _serviceCallsWaiting.length; ++j)
                {
                    var sc:ServerCall = _serviceCallsWaiting[j] as ServerCall;
                    
                    if (sc.getOperation() !== ServiceOperation.Authenticate && sc.endOfBundleMarker === true)
                    {
                        break;
                    }
                    
                    if (sc.getOperation() === ServiceOperation.Authenticate)
                    {
                        _serviceCallsWaiting.splice(j, 1);
                        _serviceCallsWaiting.push(sc);
                        break;
                    }
                }
                
                // prepare json data for server
                var jsonMessageList:Array = [];
                
                var max:int = Math.max(_serviceCallsWaiting.length - _maxBundleSize, 0);
                
                for (var i:int = _serviceCallsWaiting.length - 1; i >= 0; --i)
                {
                    var call:ServerCall = _serviceCallsWaiting[i] as ServerCall;
                    
                    _serviceCallsInProgress.push(call);
                    _serviceCallsWaiting.splice(i, 1);
                    
                    if (call.getOperation() === ServiceOperation.Authenticate || call.getOperation() === ServiceOperation.ResetEmailPassword)
                        _isAuthenticating = true;
                    
                    jsonMessageList.push(call.getJsonData());
                    
                    if (call.getOperation() === ServiceOperation.Authenticate || call.endOfBundleMarker === true)
                    {
                        break;
                    }
                }
                
                // bundle all messages
                _expectedIncomingPacketId = _packetId++;
                var allMessages:Object = {"messages": jsonMessageList, "sessionId": _sessionId, "packetId": _expectedIncomingPacketId, "gameId" : _appId};
                var jsonString:String = JSON.stringify(allMessages);
                
                if (_loggingEnabled)
                {
                    _fnDebugOutput("#BCC OUTGOING: " + jsonString);
                }
                
                if (!_killSwitchEngaged)
                {
                    if (_isAuthenticated || _isAuthenticating)
                        sendPacket(jsonString);
                    else
                    {
                        triggerCommsError(_cachedStatusCode, _cachedReasonCode, _cachedStatusMessage);
                    }
                }
                else
                {
                    triggerCommsError(StatusCodes.CLIENT_NETWORK_ERROR, ReasonCodes.CLIENT_DISABLED, "Client has been disabled due to repeated errors from a single API call");
                }
            }
        }
        
        private function sendPacket(jsonPacket:String):void
        {
            // Now we'll take our string append an application secret, and MD5 it, adding that to the HTTP header
            // This is based loosely on facebook signatures... 
            // http://developers.facebook.com/docs/authentication/fb_sig/
            var sig:String = MD5.hash(jsonPacket + _secret);
            
            _urlRequest.data = jsonPacket;
            _urlRequest.requestHeaders.push(new URLRequestHeader("X-SIG", sig));
            _urlRequest.requestHeaders.push(new URLRequestHeader("X-APPID", _appId));
            
            // setup timeout timer... 
            startTimeoutTimer(getTimeoutForRetryCount(_retryCount));
            
            getLoader().load(_urlRequest);
        }
        
        public function onResponseReceived(in_event:Event):void
        {
            var jsonData:Object = JSON.parse((getLoader().data));
            processIncomingPacket(jsonData);
        }
        
        private function processIncomingPacket(jsonData:Object):void
        {
            //stop timeout
            stopTimeoutTimer();
            
            if (_loggingEnabled)
            {
                _fnDebugOutput("#BCC INCOMING: " + JSON.stringify(jsonData));
                if (_serviceCallsInProgress.length <= 0 || !jsonData)
                {
                    _fnDebugOutput("Unexpected null: " + _serviceCallsInProgress + " " + jsonData);
                }
            }
            
            if (jsonData.packetId === _expectedIncomingPacketId)
            {
                var responses:Array = jsonData.responses;
                for (var i:uint = 0; i < _serviceCallsInProgress.length && i < responses.length; ++i)
                {
                    var serverCall:ServerCall = (_serviceCallsInProgress[i] as ServerCall);
                    _responses.push(new ServerResponse(serverCall, responses[i]));
                }
            }
            else
            {
                _fnErrorOutput("Unexpected packet received! Expected " + _expectedIncomingPacketId + " but got " + jsonData.packetId);
            }
            
            _expectedIncomingPacketId = NO_PACKET_EXPECTED;
            _serviceCallsInProgress.length = 0;
            
            //event
            if (_eventCallback != null && jsonData.hasOwnProperty("events"))
            {
                var events:Array = jsonData.events as Array;
                _eventResponses = _eventResponses.concat(events);
            }
            
            releaseLoader();
            startHeartbeatTimer();
        }
        
        private function processServiceResponse(serverCall:ServerCall, jsonObject:Object):void
        {
            var cbObject:Object = serverCall.getCallbackObject();
            
            var statusCode:int = int(jsonObject["status"]);
            if (statusCode == StatusCodes.OK)
            {
                var data:Object = jsonObject.data;

                // A session id or a profile id could potentially come back in any messages
                //we also want to see if switchToAppId comes back
                if (data != null)
                {
                    if (data.sessionId != null)
                    {
                        _sessionId = data.sessionId;
                    }
                    if (data.profileId != null)
                    {
                        _profileId = data.profileId;
                    }
                    if (data.switchToAppId != null)
                    {
                        _appId = data["switchToAppId"];
                        _secret = _secretMap[_appId];
                    }
                }

                if (serverCall.getServiceName() == ServiceName.Authenticate)
                {
                    _sessionId = data.sessionId;
                    _profileId = data.profileId;
                    _idleTimeout = data.playerSessionExpiry * 0.85;
                    _maxBundleSize = data.maxBundleMsgs;
                    
                    if(data.hasOwnProperty("maxKillCount"))
                        _killSwitchThreshold = data.maxKillCount;
                    
                    _client.authenticationService.profileId = _profileId;
                    _isAuthenticated = true;
                    resetErrorCache();
                }
                else if (serverCall.getOperation() == ServiceOperation.Logout || serverCall.getOperation() == ServiceOperation.FullReset)
                {
                    _sessionId = "";
                    _profileId = "";
                    _client.authenticationService.profileId = "";
                    _isAuthenticated = false;
                    resetErrorCache();
                }
                
                var successCallback:Function = serverCall.getSuccessCallback();
                if (successCallback != null) successCallback(jsonObject, cbObject);
                
                resetKillSwitch();
            }
            else
            {
                var reasonCode:int = int(jsonObject["reason_code"])
                
                if (reasonCode == ReasonCodes.PLAYER_SESSION_EXPIRED || reasonCode == ReasonCodes.NO_SESSION || reasonCode == ReasonCodes.PLAYER_SESSION_LOGGED_OUT)
                {
                    _sessionId = "";
                    _isAuthenticated = false;
                    _fnErrorOutput("Received session expired or not found, need to re-authenticate");
                    
                    // cache error if session related
                    _cachedStatusCode = statusCode;
                    _cachedReasonCode = reasonCode;
                    _cachedStatusMessage = jsonObject["status_message"];
                }
                else if (serverCall.getOperation() == ServiceOperation.Logout && reasonCode == ReasonCodes.CLIENT_NETWORK_ERROR_TIMEOUT)
                {
                    _isAuthenticated = false;
                    _sessionId = "";
                    _fnErrorOutput("Could not communicate with the server on logout due to network timeout");
                }
                
                var errorCallback:Function = serverCall.getErrorCallback();
                if (errorCallback != null) errorCallback(statusCode, reasonCode, jsonObject, cbObject);
                if (_globalErrorCallback != null) _globalErrorCallback(statusCode, reasonCode, jsonObject, cbObject);
                
                updateKillSwitch(serverCall.getServiceName(), serverCall.getOperation(), statusCode);
            }
        }
        
        private function onSendSecurityError(event:SecurityErrorEvent):void
        {
            _fnErrorOutput("onSendSecurityError: " + event.toString());
            retry();
        }
        
        private function onSendError(event:IOErrorEvent):void
        {
            _fnErrorOutput("Network error! " + event.toString());
            retry();
        }
        
        private function retry():void
        {
            if (canRetry())
            {
                _fnErrorOutput("Server timed out. Retrying...");
                _retryCount++;
                resendActivePacket();
                startTimeoutTimer(getTimeoutForRetryCount(_retryCount));
            }
            else
            {
                _fnErrorOutput("Server timed out - retry limit reached.");
                
                if (_cacheMessagesOnNetworkError && _networkErrorCallback != null)
                {
                    _fnErrorOutput("Caching messages");
                    _blockingQueue = true;
                    _networkErrorCallback();
                }
                else
                {
                    triggerCommsError(StatusCodes.CLIENT_NETWORK_ERROR, ReasonCodes.CLIENT_NETWORK_ERROR_TIMEOUT, "Timeout trying to reach brainCloud server");
                }
            }
        }
        
        private function triggerCommsError(statusCode:uint, reasonCode:uint, message:Object):void
        {
            var response:Object = {"status": statusCode, "reason_code": reasonCode, "status_message": message};
            
            var bundle:Object = {"packetId": _expectedIncomingPacketId};
            
            var responses:Array = [];
            for (var i:uint = 0; i < _serviceCallsInProgress.length; ++i)
            {
                responses.push(response);
            }
            
            bundle.responses = responses;
            processIncomingPacket(bundle);
        }
        
        private function onTimeout(in_event:TimerEvent):void
        {
            _retryCount++;
            getLoader().close();
            retry();
        }
        
        private function resendActivePacket():void
        {
            _urlRequest.url = _url;
            getLoader().load(_urlRequest);
        }
        
        private function startTimeoutTimer(timeout:uint):void
        {
            if (!_timeoutTimer)
            {
                _timeoutTimer = new Timer(timeout, 1);
                _timeoutTimer.addEventListener(TimerEvent.TIMER, onTimeout);
            }
            else
            {
                _timeoutTimer.reset();
                _timeoutTimer.delay = timeout;
            }
            _timeoutTimer.start();
        }
        
        private function stopTimeoutTimer():void
        {
            if (_timeoutTimer)
            {
                _timeoutTimer.stop();
            }
        }
        
        private function canRetry():Boolean
        {
            return _retryCount < _packetTimeouts.length && !_isAuthenticating;
        }
        
        private function getTimeoutForRetryCount(retryCount:uint):uint
        {
            if (_isAuthenticating) return _authPacketTimeoutSecs * 1000;
            return _packetTimeouts[_retryCount] * 1000;
        }
        
        private function updateKillSwitch(service:String, operation:String, statusCode:int):void
        {
            if (statusCode == StatusCodes.CLIENT_NETWORK_ERROR) return;
            
            if (_killSwitchService == null)
            {
                _killSwitchService = service;
                _killSwitchOperation = operation;
                _killSwitchErrorCount++;
            }
            else if (service == _killSwitchService && operation == _killSwitchOperation)
                _killSwitchErrorCount++;
            
            if (!_killSwitchEngaged && _killSwitchErrorCount >= _killSwitchThreshold)
            {
                _killSwitchEngaged = true;
                _fnDebugOutput("Client disabled due to repeated errors from a single API call: " + service + " | " + operation);
            }
        }
        
        private function resetKillSwitch():void
        {
            _killSwitchErrorCount = 0;
            _killSwitchService = null;
            _killSwitchOperation = null;
        }
        
        private function resetErrorCache():void
        {
            _cachedStatusCode = StatusCodes.FORBIDDEN;
            _cachedReasonCode = ReasonCodes.NO_SESSION;
            _cachedStatusMessage = "No session";
        }
        
        private function releaseLoader():void
        {
            if (_loader == null)
                return;
            
            try
            {
                _loader.close();
            }
            catch (error:Error)
            {
                //not a problem
            }
            
            _loader.removeEventListener(Event.COMPLETE, onResponseReceived);
            _loader.removeEventListener(IOErrorEvent.IO_ERROR, onSendError);
            _loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSendSecurityError);
            _loader = null;
        }
        
        protected function getLoader():URLLoader
        {
            if (!_loader)
            {
                _loader = new URLLoader();
                _loader.addEventListener(Event.COMPLETE, onResponseReceived);
                _loader.addEventListener(IOErrorEvent.IO_ERROR, onSendError);
                _loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSendSecurityError);
            }
            
            return _loader;
        }

        public function setHeartbeat(ms:uint):void
        {
            if (_desiredIdleTimeout != ms)
            {
                _desiredIdleTimeout = ms;
                if (_heartbeatTimer.running)
                {
                    stopHeartbeatTimer();
                    startHeartbeatTimer();
                }
            }
        }
        
        private function startHeartbeatTimer():void
        {
            _heartbeatTimer.reset();
            if (_desiredIdleTimeout == 0)
            {
                _heartbeatTimer.delay = _idleTimeout > 0 ? _idleTimeout * 1000 : 60000;
            }
            else
            {
                _heartbeatTimer.delay = _desiredIdleTimeout;
            }
            _heartbeatTimer.start();
        }
        
        private function stopHeartbeatTimer():void
        {
            _heartbeatTimer.stop();
            _heartbeatTimer.reset();
        }
        
        public function setDebugOutputFunctions(fnDebugOutput:Function, fnErrorOutput:Function, in_usePacketDebugOutput:Boolean):void
        {
            _fnDebugOutput = fnDebugOutput;
            _fnErrorOutput = fnErrorOutput;
            _loggingEnabled = in_usePacketDebugOutput;
        }
        
        public function release():void
        {
            if (_loader != null)
            {
                releaseLoader();
            }
        }
    }
}