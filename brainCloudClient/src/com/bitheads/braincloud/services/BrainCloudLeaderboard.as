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
        public function getGlobalLeaderboardPage(leaderboardId:String, sort:SortOrder, startIndex:uint, endIndex:uint,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			getGlobalLeaderboardPageByVersion(leaderboardId, sort, startIndex, endIndex, -1, successCallback, errorCallback, cbObject);
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
         * @param versionId The historical version to retrieve.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardPageByVersion(leaderboardId:String, sort:SortOrder, startIndex:uint, endIndex:uint, versionId:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "startIndex":startIndex,
                "endIndex":endIndex
            };	
            
            if (versionId != -1)
               data.versionId = versionId;
			
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
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardView(leaderboardId:String, sort:SortOrder, beforeCount:uint, afterCount:uint,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			getGlobalLeaderboardViewByVersion(leaderboardId, sort, beforeCount, afterCount, -1, successCallback, errorCallback, cbObject);
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
         * @param versionId The historical version to retrieve.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardViewByVersion(leaderboardId:String, sort:SortOrder, beforeCount:uint, afterCount:uint, versionId:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "sort":sort.value,
                "beforeCount":beforeCount,
                "afterCount":afterCount
            };	
            
            if (versionId != -1)
                data.versionId = versionId;
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardView, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets the number of entries in a global leaderboard
         *
         * Service Name - leaderboard
         * Service Operation - GET_GLOBAL_LEADERBOARD_ENTRY_COUNT
         *
         * @param leaderboardId The leaderboard ID
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getGlobalLeaderboardEntryCount(leaderboardId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGlobalLeaderboardEntryCount, data, successCallback, errorCallback, cbObject);
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
         * Retrieve the social leaderboard for a group by version.
         *
         * Service Name - leaderboard
         * Service Operation - GET_GROUP_SOCIAL_LEADERBOARD_BY_VERSION
         *
         * @param leaderboardId The leaderboard to retrieve
         * @param groupId The ID of the group
         * @param versionId the version 
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
        */
        public function getGroupSocialLeaderboardByVersion(leaderboardId:String, groupId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "groupId": groupId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetGroupSocialLeaderboardByVersion, data, successCallback, errorCallback, cbObject);
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
		 * Retrieve the social leaderboard for a list of players by their version.
		 *
		 * Service Name - leaderboard
		 * Service Operation - GET_PLAYERS_SOCIAL_LEADERBOARD_BY_VERSION
		 *
		 * @param leaderboardId The leaderboard to retrieve
		 * @param profileIds The IDs of the players
         * @param versionId the version
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		*/
        public function getPlayersSocialLeaderboardByVersion(leaderboardId:String, profileIds:Array, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "profileIds": profileIds,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetPlayersSocialLeaderboardByVersion, data, successCallback, errorCallback, cbObject);
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
         * Method returns the social leaderboard by its version. A player's social leaderboard is
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
         * @param versionId The version
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         */
        public function getSocialLeaderboardByVersion(leaderboardId:String, replaceName:Boolean, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "replaceName":replaceName,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetSocialLeaderboardByVersion, data, successCallback, errorCallback, cbObject);
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
        
        /**
         * Retrieve a list of all leaderboards
         *
         * Service Name - leaderboard
         * Service Operation - LIST_ALL_LEADERBOARDS
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
         * @param rotationReset Date to start rotation calculations
         * @param retainedCount How many rotations to keep
         * @param numDaysToRotate How many days between each rotation
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function postScoreToDynamicLeaderboardDays(leaderboardId:String, score:int, data:Object, leaderboardType:LeaderboardType, rotationType:RotationType, rotationReset:Date, retainCount:uint,
            numDaysToRotate:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var callData:Object = {
                "leaderboardId": leaderboardId,
                "score":score,
                "leaderboardType": leaderboardType.value,
                "rotationType": "DAYS",
                "rotationReset": rotationReset.time,
                "retainCount": retainCount,
                "numDaysToRotate": numDaysToRotate
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
         * Removes a player's score from the leaderboard
         *
         * Service Name - leaderboard
         * Service Operation - REMOVE_PLAYER_SCORE
         *
         * @param leaderboardId The leaderboard ID
         * @param versionId The version of the leaderboard. Use -1 for current.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function removePlayerScore(leaderboardId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.RemovePlayerScore, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets a player's score from a leaderboard
         *
         * Service Name - leaderboard
         * Service Operation - GET_PLAYER_SCORE
         *
         * @param leaderboardId The leaderboard ID
         * @param versionId The version of the leaderboard. Use -1 for current.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPlayerScore(leaderboardId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetPlayerScore, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets a player's score from multiple leaderboards
         *
         * Service Name - leaderboard
         * Service Operation - GET_PLAYER_SCORES_FROM_LEADERBOARDS
         *
         * @param leaderboardIds A collection of leaderboardIds to retrieve scores from
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPlayerScoresFromLeaderboards(leaderboardIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardIds": leaderboardIds
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Leaderboard, ServiceOperation.GetPlayerScoresFromLeaderboards, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}