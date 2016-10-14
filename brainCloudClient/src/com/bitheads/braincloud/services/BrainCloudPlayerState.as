package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	import com.bitheads.braincloud.types.AuthenticationType;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudPlayerState
	{
		private var _client:BrainCloudClient;
		
		public function BrainCloudPlayerState(client:BrainCloudClient)
		{
			_client = client;
		}
        
        public function deletePlayer(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.FullReset, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        public function getAttributes(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.GetAttributes, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        public function logout(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.Logout, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        public function readPlayerState(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}	
        
        public function updateAttributes(attributes:Object, wipeExisting:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "attributes": attributes,
                "wipeExisting": wipeExisting
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateAttributes, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

		public function updatePlayerName(playerName:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerName": playerName             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateName, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        public function updateSummaryFriendData(data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "summaryFriendData": data             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateSummary, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}	
        
        public function removeAttributes(attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "attributes": attributes
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.RemoveAttributes, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
	}
}