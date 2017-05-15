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
		
		/**
		 * @deprecated Use readFriendUserState instead - removal after September 1 2017
		 */
		public function deletePlayer(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.FullReset, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Completely deletes the user record and all data fully owned by the
         * user. After calling this method, the user will need to
         * re-authenticate and create a new profile. This is mostly used for
         * debugging/qa.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteUser(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.FullReset, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Retrieve the user's attributes.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getAttributes(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.GetAttributes, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Logs user's out of server.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function logout(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.Logout, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
		/**
		 * @deprecated Use readUserState instead - removal after September 1 2017
		 */
		public function readPlayerState(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}	
		
        /**
         * Read the state of the currently logged in user. This method returns a
         * JSON object describing most of the user's data: entities, statistics,
         * level, currency. Apps will typically call this method after
         * authenticating to get an up-to-date view of the user's data.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readUserState(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}	
        
        /**
         * Remove user's attributes.
         *
         * @param attributeNames Array of attribute names.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function removeAttributes(attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "attributes": attributes
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.RemoveAttributes, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
		/**
		 * @deprecated Use resetUser instead - removal after September 1 2017
		 */
		public function resetPlayer(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{	
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.DataReset, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
		
        /**
         * This method will delete *most* data for the currently logged in user.
         * Data which is not deleted includes: currency, credentials, and purchase
         * transactions. ResetPlayer is different from DeletePlayer in that the
         * user record will continue to exist after the reset (so the user does
         * not need to re-authenticate).
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetUser(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{	
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.DataReset, null, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Update user's attributes.
         *
         * @param attributes Single layer json string that is a set of key-value pairs
         * @param wipeExisting Whether to wipe existing attributes prior to update.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateAttributes(attributes:Object, wipeExisting:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "attributes": attributes,
                "wipeExisting": wipeExisting
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateAttributes, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

		/**
		 * @deprecated Use updateUserName instead - removal after September 1 2017
		 */
		public function updatePlayerName(userName:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerName": userName             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateName, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
		
        /**
         * Sets the user's visible name
         *
         * @param userName The name of the user to be packed
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
		public function updateUserName(userName:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerName": userName             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateName, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Updates the "friend summary data" associated with the logged in user.
         * Some operations will return this summary data. For instance the social
         * leaderboards will return the player's score in the leaderboard along
         * with the friend summary data. Generally this data is used to provide
         * a quick overview of the user without requiring a separate API call
         * to read their public stats or entity data.
         *
         * @param friendSummaryData A JSON string defining the summary data.
         * For example:
         * {
         *   "xp":123,
         *   "level":12,
         *   "highScore":45123
         * }
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateSummaryFriendData(friendSummaryData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "summaryFriendData": friendSummaryData             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateSummary, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}	
        
		/**
		 * @deprecated Use updateUserPictureUrl instead - removal after September 1 2017
		 */
		public function updatePlayerPictureUrl(pictureUrl:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerPictureUrl": pictureUrl             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdatePlayerPicture, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
		
        /**
         * Update user picture URL.
         *
         * Service Name - PlayerState
         * Service Operation - UPDATE_PICTURE_URL
         *
         * @param pictureUrl URL to apply
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateUserPictureUrl(pictureUrl:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerPictureUrl": pictureUrl             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdatePlayerPicture, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Update the user's contact email.
         * Note this is unrelated to email authentication.
         *
         * Service Name - PlayerState
         * Service Operation - UPDATE_CONTACT_EMAIL
         *
         * @param contactEmail Updated email
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateContactEmail(contactEmail:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "contactEmail": contactEmail             
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlayerState, ServiceOperation.UpdateContactEmail, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}    
	}
}