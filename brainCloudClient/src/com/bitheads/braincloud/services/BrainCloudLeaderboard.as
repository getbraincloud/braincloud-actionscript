package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
    import com.bitheads.braincloud.types.LeaderboardType;
    import com.bitheads.braincloud.types.RotationType;
    import com.bitheads.braincloud.types.SortOrder;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudLeaderboard extends BrainCloudService
	{		        
        public function BrainCloudLeaderboard(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * If a social leaderboard has been configured to reset periodically, each period
         * can be considered to be a tournament. When the leaderboard resets, the tournament
         * has ended and participants can be ranked based on their final scores.
         *
         * This API method will return the sorted leaderboard including:
         * the player
         * the game's pacers
         * all friends who participated in the tournament
         *
         * This API method will return the leaderboard results for a particular
         * tournament only once. If the method is called twice, the second call
         * will yield an empty result.
         *
         * Note that if the leaderboard has not been configured to reset, the concept of a
         * tournament does not apply.
         *
         * @param leaderboardId The id of the leaderboard
         * @param replaceName True if the player's name should be replaced with "You"
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCompletedLeaderboardTournament(leaderboardId:String, replaceName:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "replaceName":replaceName
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetCompletedTournament, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns a page of global leaderboard results.
         *
         * Leaderboards entries contain the player's score and optionally, some user-defined
         * data associated with the score.
         *
         * Note: This method allows the client to retrieve pages from within the global leaderboard list
         *
         * Service Name - SocialLeaderboard
         * Service Operation - GetGlobalLeaderboardPage
         *
         * @param leaderboardId The id of the leaderboard to retrieve.
         * @param sort Sort key Sort order of page.
         * @param startIndex The index at which to start the page.
         * @param endIndex The index at which to end the page.
         * @param includeLeaderboardSize Whether to return the leaderboard size
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardPage(leaderboardId:String, sort:SortOrder, startIndex:uint, endIndex:uint, includeLeaderboardSize:Boolean, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "startIndex":startIndex,
                "endIndex":endIndex,
                "includeLeaderboardSize":includeLeaderboardSize
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardPage, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns a page of global leaderboard results.
         * By using a non-current version id, the user can retrieve a historical leaderboard.
         * See GetGlobalLeaderboardVersions method to retrieve the version id.
         *
         * Service Name - SocialLeaderboard
         * Service Operation - GetGlobalLeaderboardPage
         *
         * @param leaderboardId The id of the leaderboard to retrieve.
         * @param sort Sort key Sort order of page.
         * @param startIndex The index at which to start the page.
         * @param endIndex The index at which to end the page.
         * @param includeLeaderboardSize Whether to return the leaderboard size
         * @param versionId The historical version to retrieve.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardPageByVersion(leaderboardId:String, sort:SortOrder, startIndex:uint, endIndex:uint, includeLeaderboardSize:Boolean, versionId:uint,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "startIndex":startIndex,
                "endIndex":endIndex,
                "includeLeaderboardSize":includeLeaderboardSize,
                "versionId":versionId
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardPage, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /** Gets the global leaderboard versions.
         *
         * Service Name - SocialLeaderboard
         * Service Operation - GetGlobalLeaderboardVersions
         *
         * @param leaderboardId The leaderboard
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardVersions(leaderboardId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardVersions, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns a view of global leaderboard results that centers on the current player.
         *
         * Leaderboards entries contain the player's score and optionally, some user-defined
         * data associated with the score.
         *
         * Service Name - SocialLeaderboard
         * Service Operation - GetGlobalLeaderboardView
         *
         * @param leaderboardId The id of the leaderboard to retrieve.
         * @param sort Sort key Sort order of page.
         * @param beforeCount The count of number of players before the current player to include.
         * @param afterCount The count of number of players after the current player to include.
         * @param includeLeaderboardSize Whether to return the leaderboard size
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardView(leaderboardId:String, sort:SortOrder, beforeCount:uint, afterCount:uint, includeLeaderboardSize:Boolean, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "beforeCount":beforeCount,
                "afterCount":afterCount,
                "includeLeaderboardSize":includeLeaderboardSize
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardView, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns a view of global leaderboard results that centers on the current player.
         * By using a non-current version id, the user can retrieve a historical leaderboard.
         * See GetGlobalLeaderboardVersions method to retrieve the version id.
         *
         * Service Name - SocialLeaderboard
         * Service Operation - GetGlobalLeaderboardView
         *
         * @param leaderboardId The id of the leaderboard to retrieve.
         * @param sort Sort key Sort order of page.
         * @param beforeCount The count of number of players before the current player to include.
         * @param afterCount The count of number of players after the current player to include.
         * @param includeLeaderboardSize Whether to return the leaderboard size
         * @param versionId The historical version to retrieve.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardViewByVersion(leaderboardId:String, sort:SortOrder, beforeCount:uint, afterCount:uint, includeLeaderboardSize:Boolean, versionId:uint,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "beforeCount":beforeCount,
                "afterCount":afterCount,
                "includeLeaderboardSize":includeLeaderboardSize,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardView, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Retrieve the social leaderboard for a group.
         *
         * Service Name - leaderboard
         * Service Operation - GET_GROUP_SOCIAL_LEADERBOARD
         *
         * @param leaderboardId The leaderboard to retrieve
         * @param groupId The ID of the group
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
        */
        public function getGroupSocialLeaderboard(leaderboardId:String, groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "groupId": groupId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGroupSocialLeaderboard, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
		 * Retrieve the social leaderboard for a list of players.
		 *
		 * Service Name - leaderboard
		 * Service Operation - GET_PLAYERS_SOCIAL_LEADERBOARD
		 *
		 * @param leaderboardId The leaderboard to retrieve
		 * @param profileIds The IDs of the players
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		*/
        public function getPlayersSocialLeaderboard(leaderboardId:String, profileIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "profileIds": profileIds
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetPlayersSocialLeaderboard, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method returns the social leaderboard. A player's social leaderboard is
         * comprised of players who are recognized as being your friend.
         * For now, this applies solely to Facebook connected players who are
         * friends with the logged in player (who also must be Facebook connected).
         * In the future this will expand to other identification means (such as
         * Game Center, Google circles etc).
         *
         * Leaderboards entries contain the player's score and optionally, some user-defined
         * data associated with the score. The currently logged in player will also
         * be returned in the social leaderboard.
         *
         * Note: If no friends have played the game, the bestScore, createdAt, updatedAt
         * will contain NULL.
         *
         * @param leaderboardId The id of the leaderboard to retrieve
         * @param replaceName If true, the currently logged in player's name will be replaced
         * by the string "You".
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         */
        public function getSocialLeaderboard(leaderboardId:String, replaceName:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "replaceName":replaceName
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetSocialLeaderboard, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Reads multiple social leaderboards.
         *
         * @param leaderboardIds Collection of leaderboard IDs.
         * @param leaderboardResultCount Maximum count of entries to return for each leaderboard.
         * @param replaceName If true, the currently logged in player's name will be replaced
         * by the string "You".
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMultiSocialLeaderboard(leaderboardIds:Array, leaderboardResultCount:uint, replaceName:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardIds": leaderboardIds,
                "leaderboardResultCount": leaderboardResultCount,
                "replaceName":replaceName
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetMultiSocialLeaderboard, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function listAllLeaderboards(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.ListAllLeaderboards, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Post the players score to the given social leaderboard.
         * Pass leaderboard config data to dynamically create if necessary.
         * You can optionally send a user-defined json string of data
         * with the posted score. This string could include information
         * relevant to the posted score.
         *
         * Service Name - SocialLeaderboard
         * Service Operation - PostScoreDynamic
         *
         * @param leaderboardId The leaderboard to post to
         * @param score The score to post
         * @param data Optional user-defined data to post with the score
         * @param leaderboardType leaderboard type
         * @param rotationType Type of rotation
         * @param rotationReset Date to start rotation calculations
         * @param retainedCount How many rotations to keep
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function postScoreToDynamicLeaderboard(leaderboardId:String, score:int, data:Object, leaderboardType:LeaderboardType, rotationType:RotationType, rotationReset:Date, retainCount:uint,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var callData:Object = {
                "leaderboardId": leaderboardId,
                "score":score,
                "leaderboardType": leaderboardType.value,
                "rotationType": rotationType.value,
                "rotationReset": rotationReset.time,
                "retainCount": retainCount
            };
            
            if (isOptionalParamValid(data)) {
                callData.data = data;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.PostScoreDynamic, callData, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Post the players score to the given social leaderboard.
         * You can optionally send a user-defined json string of data
         * with the posted score. This string could include information
         * relevant to the posted score.
         *
         * Note that the behaviour of posting a score can be modified in
         * the brainCloud portal. By default, the server will only keep
         * the player's best score.
         *
         * @param leaderboardId The leaderboard to post to
         * @param score The score to post
         * @param data Optional user-defined data to post with the score
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function postScoreToLeaderboard(leaderboardId:String, score:int, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var callData:Object = {
                "leaderboardId": leaderboardId,
                "score":score
            };
            
            if (isOptionalParamValid(data)) {
                callData.data = data;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.PostScore, callData, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Reset the player's score for the given social leaderboard id.
         *
         * @param leaderboardId The leaderboard to post to
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetLeaderboardScore(leaderboardId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.Reset, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}