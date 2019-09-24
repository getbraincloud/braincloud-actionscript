package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudDataStream extends BrainCloudService
    {                
        public function BrainCloudDataStream(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Creates custom data stream page event
         *
         * Service Name - dataStream
         * Service Operation - CUSTOM_PAGE_EVENT
         *
         * @param eventName Name of event
         * @param eventProperties Properties of event
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function customPageEvent(eventName:String, eventProperties:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "eventName": eventName
            };
            
            if (isOptionalParamValid(eventProperties)) {
                data.eventProperties  = eventProperties;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.DataStream, ServiceOperation.CustomPageEvent, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Creates custom data stream screen event
         *
         * Service Name - dataStream
         * Service Operation - CUSTOM_SCREEN_EVENT
         *
         * @param eventName Name of event
         * @param eventProperties Properties of event
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function customScreenEvent(eventName:String, eventProperties:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "eventName": eventName
            };
            
            if (isOptionalParamValid(eventProperties)) {
                data.eventProperties  = eventProperties;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.DataStream, ServiceOperation.CustomScreenEvent, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Creates custom data stream track event
         *
         * Service Name - dataStream
         * Service Operation - CUSTOM_TRACK_EVENT
         *
         * @param eventName Name of event
         * @param eventProperties Properties of event
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function customTrackEvent(eventName:String, eventProperties:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "eventName": eventName
            };
            
            if (isOptionalParamValid(eventProperties)) {
                data.eventProperties  = eventProperties;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.DataStream, ServiceOperation.CustomTrackEvent, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Creates custom data stream track event
         *
         * Service Name - dataStream
         * Service Operation - SUBMIT_CRASH_REPORT
         *
         * @param crashType Type of crash
         * @param errorMsg Message of error
         * @param crashJson
         * @param crashLog log
         * @param userName name of user
         * @param userEmail email of user
         * @param userNotes notes
         * @param userSubmitted
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function submitCrashReport(crashType:String, errorMsg:String, crashJson:Object, crashLog:String, userName:String, userEmail:String, userNotes:String, userSubmitted:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "crashType": crashType,
                "errorMsg":errorMsg,
                "crashLog": crashLog,
                "userName":userName,
                "userEmail":userEmail,
                "userNotes":userNotes,
                "userSubmitted":userSubmitted
            };

            if (isOptionalParamValid(crashJson)) 
            {
                data.crashJson  = crashJson;
            }   

            var serverCall:ServerCall = new ServerCall(ServiceName.DataStream, ServiceOperation.SubmitCrashReport, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}