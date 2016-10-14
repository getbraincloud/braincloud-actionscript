package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudPlayerStatisticsEvent extends BrainCloudService
	{		        
        public function BrainCloudPlayerStatisticsEvent(client:BrainCloudClient) 
        {
            super(client);
        }
        
        public function triggerPlayerStatisticsEvent(eventName:String, multiplier:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "eventName": eventName,
                "eventMultiplier": multiplier
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatisticsEvent, ServiceOperation.Trigger, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * See documentation for TriggerPlayerStatisticsEvent for more documentation.
         * 
         * @param events Object array:
         * [
         *   {
         *     "eventName": "event1",
         *     "eventMultiplier": 1
         *   },
         *   {
         *     "eventName": "event2",
         *     "eventMultiplier": 1
         *   }
         * ]
         * @param successCallback
         * @param errorCallback
         * @param cbObject
         */
        public function triggerPlayerStatisticsEvents(events:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "events": events
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatisticsEvent, ServiceOperation.TriggerMultiple, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}