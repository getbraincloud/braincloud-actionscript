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
        
		/**
		 * @deprecated Use triggerStatsEvent instead - removal after September 1 2017
		 */
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
         * Trigger an event server side that will increase the users statistics.
         * This may cause one or more awards to be sent back to the user - 
         * could be achievements, experience, etc. Achievements will be sent by this
         * client library to the appropriate awards service (Apple Game Center, etc).
         *
         * This mechanism supercedes the PlayerStatisticsService API methods, since
         * PlayerStatisticsService API method only update the raw statistics without
         * triggering the rewards.
         *
         * Service Name - PlayerStatisticsEvent
         * Service Operation - Trigger
         *
         * @see PlayerStatisticsService
         * 
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function triggerStatsEvent(eventName:String, multiplier:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "eventName": eventName,
                "eventMultiplier": multiplier
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatisticsEvent, ServiceOperation.Trigger, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * @deprecated Use triggerStatsEvent instead - removal after September 1 2017
		 */
		public function triggerPlayerStatisticsEvents(events:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "events": events
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatisticsEvent, ServiceOperation.TriggerMultiple, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * See documentation for TriggerPlayerStatisticsEvent for more documentation.
         *
         * Service Name - PlayerStatisticsEvent
         * Service Operation - TriggerMultiple
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
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function triggerStatsEvents(events:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "events": events
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatisticsEvent, ServiceOperation.TriggerMultiple, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}