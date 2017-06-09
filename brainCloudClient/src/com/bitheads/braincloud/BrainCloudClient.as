package com.bitheads.braincloud
{
    import com.bitheads.braincloud.*;
    import com.bitheads.braincloud.comms.*;
    import com.bitheads.braincloud.services.*;
    import com.bitheads.braincloud.types.Platform;
    import flash.system.*;
	
	
	public class BrainCloudClient
	{
		private static const BRAINCLOUD_VERSION:String = "3.5.0";
		private static const DEFAULT_SERVER_URL:String = "https://sharedprod.braincloudservers.com/dispatcherv2";
		
		private static var _instance:BrainCloudClient;
		
		private var _releasePlatform:Platform = Platform.Facebook;
		private var _appVersion:String = "1.0.0";
		private var _appId:String;
		private var _countryCode:String;
		private var _languageCode:String;
		private var _timeZoneOffset:Number;		
		private var _comms:BrainCloudComms;
        
		private var _asyncMatchService:BrainCloudAsyncMatch;
		private var _authenticationService:BrainCloudAuthentication;
        private var _dataStreamService:BrainCloudDataStream;
		private var _entityService:BrainCloudEntity;
		private var _eventService:BrainCloudEvent;
		private var _gamificationService:BrainCloudGamification;
		private var _globalApp:BrainCloudGlobalApp;     
		private var _globalEntity:BrainCloudGlobalEntity;    
		private var _globalStats:BrainCloudGlobalStatistics;      
		private var _groupService:BrainCloudGroup;
        private var _identityService:BrainCloudIdentity;
		private var _leaderboardService:BrainCloudLeaderboard;
		private var _mailService:BrainCloudMail;
		private var _matchMakingService:BrainCloudMatchMaking;
        private var _oneWayMatchService:BrainCloudOneWayMatch;
        private var _playbackStreamService:BrainCloudPlaybackStream;
		private var _playerStateService:BrainCloudPlayerState;
		private var _playerStatisticsService:BrainCloudPlayerStatistics;
		private var _playerStatisticsEventService:BrainCloudPlayerStatisticsEvent;
		private var _productService:BrainCloudProduct;
		private var _profanityService:BrainCloudProfanity;
		private var _pushNotificationService:BrainCloudPushNotification;
		private var _redemptionCodeService:BrainCloudRedemptionCode;
		private var _scriptService:BrainCloudScript;
		private var _s3HandlingService:BrainCloudS3Handling;
		private var _timeService:BrainCloudTime;
		private var _tournamentService:BrainCloudTournament;
		
		public function BrainCloudClient()
		{
			if (_instance != null)
			{
				throw new Error("BrainCloudClient is a singleton. Use BrainCloudClient.getInstance()");
			}
			else
			{
				_comms = new BrainCloudComms(this);
				
                _asyncMatchService = new BrainCloudAsyncMatch(this);
				_authenticationService = new BrainCloudAuthentication(this);
				_dataStreamService = new BrainCloudDataStream(this);
				_entityService = new BrainCloudEntity(this);
				_eventService = new BrainCloudEvent(this);
				_gamificationService = new BrainCloudGamification(this);
                _globalApp = new BrainCloudGlobalApp(this);
                _globalEntity = new BrainCloudGlobalEntity(this);
                _globalStats = new BrainCloudGlobalStatistics(this);
                _groupService = new BrainCloudGroup(this);
                _identityService = new BrainCloudIdentity(this);
				_leaderboardService = new BrainCloudLeaderboard(this);
                _mailService = new BrainCloudMail(this);
                _matchMakingService = new BrainCloudMatchMaking(this);
                _oneWayMatchService = new BrainCloudOneWayMatch(this);
                _playbackStreamService = new BrainCloudPlaybackStream(this);
				_playerStateService = new BrainCloudPlayerState(this);
				_playerStatisticsService = new BrainCloudPlayerStatistics(this);
                _playerStatisticsEventService = new BrainCloudPlayerStatisticsEvent(this);
				_productService = new BrainCloudProduct(this);
				_profanityService = new BrainCloudProfanity(this);
                _pushNotificationService = new BrainCloudPushNotification(this);
                _redemptionCodeService = new BrainCloudRedemptionCode(this);
				_scriptService = new BrainCloudScript(this);
                _s3HandlingService = new BrainCloudS3Handling(this);
				_timeService = new BrainCloudTime(this);
				_tournamentService = new BrainCloudTournament(this);
				
				initLocale();
				
				_instance = this;
			}
		}
		
		public static function get instance():BrainCloudClient
		{
			if (!_instance)
			{
				new BrainCloudClient();
			}
			return _instance;
		}
        
		/**
		 * Method initializes the BrainCloudClient.
		 *
		 * @param serverURL The url to the brainCloud server
		 *     Currently this should be:  https://sharedprod.braincloudservers.com/dispatcherv2
		 * @param secretKey The secret key for your app
		 * @param appId The app id
		 * @param appVersion The app version
		 */
		public function initialize(appId:String, secretKey:String, appVersion:String, serverUrl:String = DEFAULT_SERVER_URL):void
		{
            var error:String = null;            
            if (isNullOrEmpty(serverUrl))
                error = "serverUrl was null or empty";
            else if (isNullOrEmpty(secretKey))
                error = "secretKey was null or empty";
            else if (isNullOrEmpty(appId))
                error = "appId was null or empty";
            else if (isNullOrEmpty(appVersion))
                error = "appVersion was null or empty";
            
            if (error != null) {
                trace(error);
                return;
            }
            
			_appId = appId;
			_appVersion = appVersion;
			_comms.initialize(appId, secretKey, serverUrl);
		}
        
        private function isNullOrEmpty(str:String):Boolean
        {
            return str == null || str == "";
        }
		
        /**
		* Initialize - initializes the identity service with the saved
		* anonymous installation id and most recently used profile id
		*
		* @param profileId The id of the profile id that was most recently used by the app (on this device)
		* @param anonymousId  The anonymous installation id that was generated for this device
		*/
		public function initializeIdentity(profileId:String, anonymousId:String):void
		{
			_authenticationService.initialize(profileId, anonymousId);
		}
		
		public function enableLogging(isEnabled:Boolean):void
		{
			_comms.setDebugOutputFunctions(trace, trace, true);
		}
		
        /**
		 * Run callbacks, to be called once per frame from your main thread
		 */
		public function runCallbacks():void
		{
			_comms.runCallbacks();
		}
		
        /**
		 * Clears any pending messages from communication library.
		 */
		public function resetCommunications():void
		{
			_comms.resetCommunication();
		}
        
        /**
		 * Enables the message caching upon network error, which is disabled by default.
		 * Once enabled, if a client side network error is encountered
		 * (i.e. brainCloud server is unreachable presumably due to the client
		 * network being down) the sdk will do the following:
		 *
		 * 1 - cache the currently queued messages to brainCloud
		 * 2 - call the network error callback
		 * 3 - then expect the app to call either:
		 *     a) retryCachedMessages() to retry sending to brainCloud
		 *     b) flushCachedMessages() to dump all messages in the queue.
		 *
		 * Between steps 2 & 3, the app can prompt the user to retry connecting
		 * to brainCloud to determine whether to follow path 3a or 3b.
		 *
		 * Note that if path 3a is followed, and another network error is encountered,
		 * the process will begin all over again from step 1.
		 *
		 * WARNING - the brainCloud sdk will cache *all* api calls sent
		 * when a network error is encountered if this mechanism is enabled.
		 * This effectively freezes all communication with brainCloud.
		 * Apps must call either retryCachedMessages() or flushCachedMessages()
		 * for the brainCloud SDK to resume sending messages.
		 * resetCommunication() will also clear the message cache.
		 *
		 * @param enabled True if message should be cached on timeout
		 */
        public function enableNetworkErrorMessageCaching(enabled:Boolean):void
        {
            _comms.enableNetworkErrorMessageCaching(enabled);
        }
        
        /** 
         * Attempts to resend any cached messages. If no messages are in the cache,
		 * this method does nothing.
		 */
        public function retryCachedMessages():void
        {
            _comms.retryCachedMessages();
        }
        
        /**
		 * Flushes the cached messages to resume api call processing. This will dump
		 * all of the cached messages in the queue.
		 *
		 * @param sendApiErrorCallbacks If set to true API error callbacks will
		 * be called for every cached message with statusCode CLIENT_NETWORK_ERROR
		 * and reasonCode CLIENT_NETWORK_ERROR_TIMEOUT.
		 */
        public function flushCachedMessages(sendApiErrorCallbacks:Boolean):void
        {
            _comms.flushCachedMessages(sendApiErrorCallbacks);
        }
        
        /**
		 * Inserts a marker which will tell the brainCloud comms layer
		 * to close the message bundle off at this point. Any messages queued
		 * before this method was called will likely be bundled together in
		 * the next send to the server.
		 *
		 * To ensure that only a single message is sent to the server you would
		 * do something like this:
		 *
		 * InsertEndOfMessageBundleMarker()
		 * SomeApiCall()
		 * InsertEndOfMessageBundleMarker()
		 *
		 */
        public function insertEndOfMessageBundleMarker():void 
        {
            _comms.insertEndOfMessageBundleMarker();
        }
		
		//{ region  Getters
		
		/**
		 * @deprecated Use appId instead - removal after March 22 2017
		 */
		public function get gameId():String
		{
			return _appId;
		}
		
		public function get appId():String
		{
			return _appId;
		}
		
		public function get releasePlatform():Platform
		{
			return _releasePlatform;
		}
		
		/**
		 * @deprecated Use appVersion instead - removal after September 1 2017
		 */
		public function get gameVersion():String
		{
			return _appVersion;
		}
		
		/**
		 * @deprecated Use appVersion instead - removal after September 1 2017
		 */
		public function get version():String
		{
			return _appVersion;
		}
		 
		 public function get appVersion():String
		{
			return _appVersion;
		}
		
		public function get countryCode():String
		{
			return _countryCode;
		}
		
		public function get languageCode():String
		{
			return _languageCode;
		}
		
		public function get timeZoneOffset():Number
		{
			return _timeZoneOffset;
		}
		
		public function get clientLibVersion():String
		{
			return BRAINCLOUD_VERSION;
		}
		
        /**
		 * Returns whether the client is authenticated with the brainCloud server.
		 * @return True if authenticated, false otherwise.
		 */
		public function get isAuthenticated():Boolean
		{
			return _comms.isAuthenticated;
		}        
        
        public function getPacketTimeouts():Array
		{
			return _comms.packetTimeouts;
		}
		
		public function getSessionId():String
		{
			return _comms.getSessionId();
		}
		
		//} endregion 
		
		//{ region  Setters
		
		public function set releasePlatform(platform:Platform):void
		{
			_releasePlatform = platform;
		}
		
		public function set countryCode(countryCode:String):void
		{
			_countryCode = countryCode;
		}
		
		public function set languageCode(languageCode:String):void
		{
			_languageCode = languageCode;
		}
		
		public function set timeZoneOffset(offset:Number):void
		{
			_timeZoneOffset = offset;
		}
		
		/**
		 * The brainCloud client considers itself reauthenticated
		 * with the given session
		 *
		 * Warning: ensure the user is within your session expiry (set on the dashboard)
		 * before using this call. This optional method exists to reduce
		 * authentication calls, in event the user needs to restart the app
		 * in rapid succession.
		 * 
		 * @param sessionId the recent session id from a previous authentication
		 */
		public function restoreRecentRession(sessionId:String): void
		{
			if (sessionId == "") 
			{
				// Cannot use a blank session Id. Authenticate once,
				// and save that session for short-term use
				return;
			}
			
			_comms.setSessionId(sessionId);
			_comms.setAuthenticated();
		}
		
        /**
		 * Registers a callback that is invoked for all errors generated
		 *
		 * @param globalErrorCallback The global error callback handler.
		 */
		public function setGlobalErrorCallback(callback:Function):void
		{
			_comms.setGlobalErrorCallback(callback);
		}
		
        /**
		 * Sets a callback handler for any out of band event messages that come from
		 * brainCloud.
		 *
		 * @param eventCallback A function which takes a json string as it's only parameter.
		 * The json format looks like the following:
		 * {
		 *   "events": [{
		 *      "fromPlayerId": "178ed06a-d575-4591-8970-e23a5d35f9df",
		 *      "eventId": 3967,
		 *      "createdAt": 1441742105908,
		 *      "gameId": "123",
		 *      "toPlayerId": "178ed06a-d575-4591-8970-e23a5d35f9df",
		 *      "eventType": "test",
		 *      "eventData": {"testData": 117}
		 *    }],
		 *    ]
		 *  }
		 */
		public function setEventCallback(callback:Function):void
		{
			_comms.setEventCallback(callback);
		}
        
        /**
		 * Registers a callback that is invoked for network errors.
		 * Note this is only called if enableNetworkErrorMessageCaching
		 * has been set to true.
		 *
		 * @param networkErrorCallback The network error callback handler.
		 */
        public function setNetworkErrorCallback(callback:Function):void
		{
			_comms.setNetworkErrorCallback(callback);
		}
                
        /**
		 * Sets the packet timeouts using a list of integers that
		 * represent timeout values in seconds for each packet retry. The
		 * first item in the list represents the timeout for the first packet
		 * attempt, the second for the second packet attempt, and so on.
		 *
		 * The number of entries in this array determines how many packet
		 * retries will occur.
		 *
		 * By default, the packet timeout array is {10, 10, 10}.
		 *
		 * Note that this method does not change the timeout for authentication
		 * packets (use setAuthenticationPacketTimeout method).
		 *
		 * @param timeouts A vector of packet timeouts.
		 */
        public function setPacketTimeouts(timeouts:Array):void
		{
			_comms.packetTimeouts = timeouts;
		}
        
        /**
		 * Sets the packet timeouts back to the default ie {10, 10, 10}
		 */
        public function setPacketTimeoutsToDefault():void 
        {
            _comms.packetTimeouts = [ 10, 10, 10 ];
        }
		
		//} endregion 
		
		//{ region  Services
		
		public function get asyncMatchService():BrainCloudAsyncMatch
		{
			return _asyncMatchService;
		}
        
		public function get authenticationService():BrainCloudAuthentication
		{
			return _authenticationService;
		}
        
		public function get dataStreamService():BrainCloudDataStream
		{
			return _dataStreamService;
		}
		
		public function get entityService():BrainCloudEntity
		{
			return _entityService;
		}
		
		public function get eventService():BrainCloudEvent
		{
			return _eventService;
		}
		
		public function get gamificationService():BrainCloudGamification
		{
			return _gamificationService;
		}
		
		public function get globalAppService():BrainCloudGlobalApp
		{
			return _globalApp;
		}
		
		public function get globalEntityService():BrainCloudGlobalEntity
		{
			return _globalEntity;
		}
        
        public function get globalStatisticsService():BrainCloudGlobalStatistics
		{
			return _globalStats;
		}
        
        public function get groupService():BrainCloudGroup
		{
			return _groupService;
		}
        
        public function get identityService():BrainCloudIdentity
		{
			return _identityService;
		}
		
		public function get leaderboardService():BrainCloudLeaderboard
		{
			return _leaderboardService;
		}
		
		public function get mailService():BrainCloudMail
		{
			return _mailService;
		}
		
		public function get matchMakingService():BrainCloudMatchMaking
		{
			return _matchMakingService;
		}
        
		public function get oneWayMatchService():BrainCloudOneWayMatch
		{
			return _oneWayMatchService;
		}
        
		public function get playbackStreamService():BrainCloudPlaybackStream
		{
			return _playbackStreamService;
		}
		
		public function get playerStateService():BrainCloudPlayerState
		{
			return _playerStateService;
		}
		
		public function get playerStatisticsService():BrainCloudPlayerStatistics
		{
			return _playerStatisticsService;
		}
        
        public function get playerStatisticsEventService():BrainCloudPlayerStatisticsEvent
		{
			return _playerStatisticsEventService;
		}
		
		public function get productService():BrainCloudProduct
		{
			return _productService;
		}
		
		public function get profanityService():BrainCloudProfanity
		{
			return _profanityService;
		}
		
		public function get pushNotificationService():BrainCloudPushNotification
		{
			return _pushNotificationService;
		}
		
		public function get redemptionCodeService():BrainCloudRedemptionCode
		{
			return _redemptionCodeService;
		}
		
		public function get scriptService():BrainCloudScript
		{
			return _scriptService;
		}
		
		public function get s3HandlingService():BrainCloudS3Handling
		{
			return _s3HandlingService;
		}
		
		public function get timeService():BrainCloudTime
		{
			return _timeService;
		}
		
		public function get tournamentService():BrainCloudTournament
		{
			return _tournamentService;
		}
		
		//} endregion 
		
		public function sendRequest(serviceMessage:ServerCall):void
		{
			_comms.sendRequest(serviceMessage);
		}
		
		private function initLocale():void
		{
			_languageCode = Capabilities.language;
			
			var date:Date = new Date();
			var offset:Number = date.getTimezoneOffset();
			_timeZoneOffset = offset / 60;
		}
	}
}
