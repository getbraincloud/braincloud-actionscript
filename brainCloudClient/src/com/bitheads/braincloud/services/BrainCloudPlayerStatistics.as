package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudPlayerStatistics extends BrainCloudService
	{		        
        public function BrainCloudPlayerStatistics(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Returns JSON representing the next experience level for the user.
         *
         * Service Name - PlayerStatistics
         * Service Operation - ReadNextXpLevel
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getNextExperienceLevel(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadNextXplevel, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Increments the user's experience. If the player goes up a level,
         * the new level details will be returned along with a list of rewards.
         *
         * Service Name - PlayerStatistics
         * Service Operation - UpdateIncrement
         *
         * @param xpValue The amount to increase the user's experience by
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementExperiencePoints(xpValue:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "xp_points": xpValue  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * @deprecated Use incrementUserStats instead - removal after September 1 2017
		 */
		public function incrementPlayerStats(statisticsData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": statisticsData  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Atomically increment (or decrement) user statistics.
         * Any rewards that are triggered from user statistic increments
         * will be considered. User statistics are defined through the brainCloud portal.
         * Note also that the "xpCapped" property is returned (true/false depending on whether
         * the xp cap is turned on and whether the user has hit it).
         *
         * Service Name - PlayerStatistics
         * Service Operation - Update
         *
         * @param statisticsData The JSON encoded data to be sent to the server as follows:
         * {
         *   stat1: 10,
         *   stat2: -5.5,
         * }
         * would increment stat1 by 10 and decrement stat2 by 5.5.
         * For the full statistics grammer see the api.braincloudservers.com site.
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
        public function incrementUserStats(statisticsData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": statisticsData  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Apply statistics grammar to a partial set of statistics.
         *
         * Service Name - PlayerStatistics
         * Service Operation - PROCESS_STATISTICS
         *
         * @param jsonData The JSON format is as follows:
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
        public function processStatistics(statisticsData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": statisticsData  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ProcessStatistics, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
		/**
		 * @deprecated Use readAllUserStats instead - removal after September 1 2017
		 */
		public function readAllPlayerStats(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
        /**
         * Read all available user statistics.
         *
         * Service Name - PlayerStatistics
         * Service Operation - Read
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readAllUserStats(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * @deprecated Use readUserStatsSubset instead - removal after September 1 2017
		 */
		public function readPlayerStatsSubset(statistics:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "statistics": statistics  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadSubset, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Reads a subset of user statistics as defined by the input collection.
         *
         * Service Name - PlayerStatistics
         * Service Operation - ReadSubset
         *
         * @param statistics A collection containing the subset of statistics to read:
         * ex. [ "pantaloons", "minions" ]
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readUserStatsSubset(statistics:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "statistics": statistics  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadSubset, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
		/**
		 * @deprecated Use readUserStatsForCategory instead - removal after September 1 2017
		 */
		public function readPlayerStatsForCategory(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "category": category  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadForCategory, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
        /**
         * Method retrieves the user statistics for the given category.
         *
         * Service Name - PlayerStatistics
         * Service Operation - READ_FOR_CATEGORY
         *
         * @param category The user statistics category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readUserStatsForCategory(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "category": category  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadForCategory, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
		/**
		 * @deprecated Use resetAllUserStats instead - removal after September 1 2017
		 */
		public function resetAllPlayerStats(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Reset, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
        /**
         * Reset all of the statistics for this user back to their initial value.
         *
         * Service Name - PlayerStatistics
         * Service Operation - Reset
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetAllUserStats(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Reset, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sets the user's experience to an absolute value. Note that this
         * is simply a set and will not reward the player if their level changes
         * as a result.
         *
         * Service Name - PlayerStatistics
         * Service Operation - SetXpPoints
         *
         * @param xpValue The amount to set the the user's experience to
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function setExperiencePoints(xpValue:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "xp_points": xpValue  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.SetXpPoints, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}