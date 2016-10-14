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
        
        public function incrementPlayerStats(statisticsData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": statisticsData  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function processStatistics(statisticsData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "statistics": statisticsData  
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ProcessStatistics, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function readAllPlayerStats(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function readPlayerStatsForCategory(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
            var data:Object = {
                "category": category  
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.ReadForCategory, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function resetAllPlayerStats(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerStatistics, ServiceOperation.Reset, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}