package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudGlobalStatistics extends BrainCloudService
	{		        
        public function BrainCloudGlobalStatistics(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Atomically increment (or decrement) global statistics.
         * Global statistics are defined through the brainCloud portal.
         *
         * Service Name - GlobalStatistics
         * Service Operation - UpdateIncrement
         *
         * @param stats The JSON encoded data to be sent to the server as follows:
         * {
         *   stat1: 10,
         *   stat2: -5.5,
         * }
         * would increment stat1 by 10 and decrement stat2 by 5.5.
         * For the full statistics grammar see the api.braincloudservers.com site.
         * There are many more complex operations supported such as:
         * {
         *   stat1:INC_TO_LIMIT#9#30
         * }
         * which increments stat1 by 9 up to a limit of 30.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementGlobalStats(stats:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": stats  
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalStatistics, ServiceOperation.UpdateIncrement, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns all of the global statistics.
         *
         * Service Name - GlobalStatistics
         * Service Operation - Read
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readAllGlobalStats(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalStatistics, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Reads a subset of global statistics as defined by the input JSON.
         *
         * Service Name - GlobalStatistics
         * Service Operation - ReadSubset
         *
         * @param stats The json data containing an array of statistics to read:
         * [
         *   "Level01_TimesBeaten",
         *   "Level02_TimesBeaten"
         * ]
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGlobalStatsSubset(stats:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": stats  
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalStatistics, ServiceOperation.ReadSubset, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method retrieves the global statistics for the given category.
         *
         * Service Name - GlobalStatistics
         * Service Operation - READ_FOR_CATEGORY
         *
         * @param category The global statistics category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGlobalStatsForCategory(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "category": category  
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalStatistics, ServiceOperation.ReadForCategory, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Apply statistics grammar to a partial set of statistics.
         *
         * Service Name - PlayerStatistics
         * Service Operation - PROCESS_STATISTICS
         *
         * @param stats The JSON format is as follows:
         * {
         *     "DEAD_CATS": "RESET",
         *     "LIVES_LEFT": "SET#9",
         *     "MICE_KILLED": "INC#2",
         *     "DOG_SCARE_BONUS_POINTS": "INC#10",
         *     "TREES_CLIMBED": 1
         * }
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function processStatistics(stats:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": stats  
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalStatistics, ServiceOperation.ProcessStatistics, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}