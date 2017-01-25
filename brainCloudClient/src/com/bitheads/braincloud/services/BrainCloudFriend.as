package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.types.AuthenticationType;
    import com.bitheads.braincloud.types.FriendPlatform;
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.IServiceResponse;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudFriend extends BrainCloudService
	{		        
        public function BrainCloudFriend(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Links the current player and the specified players as brainCloud friends.
         *
         * Service Name - Friend
         * Service Operation - ADD_FRIENDS
         *
         * @param profileIds Collection of player IDs.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function addFriends(friendIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "friendIds": friendIds  
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.AddFriends, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Retrieves profile information for the partial matches of the specified text.
         *
         * @param searchText Universal ID text on which to search.
         * @param maxResults Maximum number of results to return.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findPlayerByUniversalId(searchText:String, maxResults:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "searchText": searchText,
                "maxResults": maxResults
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.FindPlayerByUniversalId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Finds a list of players matching the search text by performing an exact match search
         *
         * Service Name - friend
         * Service Operation - FIND_USERS_BY_EXACT_NAME
         *
         * @param searchText The string to search for.
         * @param maxResults  Maximum number of results to return.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findUsersByExactName(searchText:String, maxResults:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "searchText": searchText,
                "maxResults": maxResults
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.FindUsersByExactName, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Finds a list of players matching the search text by performing a substring
         * search of all player names.
         *
         * Service Name - friend
         * Service Operation - FIND_USERS_BY_SUBSTR_NAME
         *
         * @param searchText The substring to search for. Minimum length of 3 characters.
         * @param maxResults  Maximum number of results to return. If there are more the message
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findUsersBySubstrName(searchText:String, maxResults:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "searchText": searchText,
                "maxResults": maxResults
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.FindUsersBySubstrName, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function findUsersByUserSummary(where:Object, maxResults:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "where": where,
                "maxResults": maxResults
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.FindUsersByUserSummary, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}     
        
        /**
         * Retrieves the external ID for the specified user profile ID on the specified social platform.
         *
         * @param profileId Profile (player) ID.
         * @param authenticationType Associated authentication type.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getExternalIdForProfileId(profileId:String, authenticationType:AuthenticationType, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "authenticationType": authenticationType.name
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.GetExternalIdForProfileId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}  
                
        /**
         * Retrieves profile information for the specified user.
         *
         * Service Name - friend
         * Service Operation - GET_PROFILE_INFO_FOR_CREDENTIAL
         *
         * @param externalId The users's external ID
         * @param authenticationType The authentication type of the user ID
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getProfileInfoForCredential(externalId:String, authenticationType:AuthenticationType, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "externalId": externalId,
                "authenticationType": authenticationType.name
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.GetProfileInfoForCredential, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}  
        
        /**
         * Retrieves profile information for the specified external auth user.
         *
         * Service Name - friend
         * Service Operation - GET_PROFILE_INFO_FOR_EXTERNAL_AUTH_ID
         *
         * @param externalId External ID of the user to find
         * @param externalAuthType The external authentication type used for this users's external ID
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getProfileInfoForExternalAuthId(externalId:String, externalAuthType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "externalId": externalId,
                "externalAuthType": externalAuthType
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.GetProfileInfoForExternalAuthId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}  
        
        /**
         * Returns player state of a particular user.
         *
         * Service Name - Friend
         * Service Operation - GET_SUMMARY_DATA_FOR_PROFILE_ID
         *
         * @param profileId Profile Id of player to retrieve player state for.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSummaryDataForProfileId(profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.GetSummaryDataForProfileId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}  
        
        /**
         * Get users online status
         *
         * Service Name - Friend
         * Service Operation - GET_USERS_ONLINE_STATUS
         *
         * @param profileIds Collection of profile IDs.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getUsersOnlineStatus(profileIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileIds": profileIds
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.GetUsersOnlineStatus, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Retrieves a list of player and friend platform information for all friends of the current player.
         *
         * Service Name - Friend
         * Service Operation - LIST_FRIENDS
         *
         * @param friendPlatform Friend platform to query.
         * @param includeSummaryData  True if including summary data; false otherwise.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function listFriends(friendPlatform:FriendPlatform, includeSummaryData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "friendPlatform": friendPlatform.name,
                "includeSummaryData":includeSummaryData
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.ListFriends, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns a particular entity of a particular friend.
         *
         * Service Name - Friend
         * Service Operation - ReadFriendEntity
         *
         * @param entityId Id of entity to retrieve.
         * @param friendId Profile Id of friend who owns entity.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readFriendEntity(entityId:String, friendId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "friendId":friendId
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.ReadFriendEntity, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Read a friend's player state.
         *
         * Service Name - Friend
         * Service Operation - ReadFriendsPlayerState
         *
         * @param friendId Target friend
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readFriendPlayerState(friendId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "friendId":friendId
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.ReadFriendsPlayerState, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns entities of all friends optionally based on type.
         *
         * Service Name - Friend
         * Service Operation - ReadFriendsEntities
         *
         * @param entityType Types of entities to retrieve.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readFriendsEntities(entityType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityType":entityType
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.ReadFriendsEntities, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Unlinks the current player and the specified players as brainCloud friends.
         *
         * Service Name - Friend
         * Service Operation - REMOVE_FRIENDS
         *
         * @param profileIds Collection of player IDs.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function removeFriends(profileIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileIds":profileIds
            };		
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Friend, ServiceOperation.RemoveFriends, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}