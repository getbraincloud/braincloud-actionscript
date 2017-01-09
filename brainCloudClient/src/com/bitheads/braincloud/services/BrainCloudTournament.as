package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudTournament extends BrainCloudService
	{		        
        public function BrainCloudTournament(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Processes any outstanding rewards for the given player
         *
         * Service Name - tournament
         * Service Operation - CLAIM_TOURNAMENT_REWARD
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param versionId Version of the tournament. Use -1 for the latest version.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function claimTournamentReward(leaderboardId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.ClaimTournamentReward, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Get tournament status associated with a leaderboard
         *
         * Service Name - tournament
         * Service Operation - GET_TOURNAMENT_STATUS
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param versionId Version of the tournament. Use -1 for the latest version.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getTournamentStatus(leaderboardId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.GetTournamentStatus, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Join the specified tournament.
         * Any entry fees will be automatically collected.
         *
         * Service Name - tournament
         * Service Operation - JOIN_TOURNAMENT
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param tournamentCode Tournament to join
         * @param initialScore Initial score for the user
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function joinTournament(leaderboardId:String, tournamentCode:String, initialScore:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "tournamentCode": tournamentCode,
                "initialScore": initialScore
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.JoinTournament, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Removes player's score from tournament leaderboard
         *
         * Service Name - tournament
         * Service Operation - LEAVE_TOURNAMENT
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function leaveTournament(leaderboardId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.LeaveTournament, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Post the users score to the leaderboard
         *
         * Service Name - tournament
         * Service Operation - POST_TOURNAMENT_SCORE
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param score The score to post
         * @param data Optional data attached to the leaderboard entry
         * @param roundStartedTime Time the user started the match resulting in the score being posted in UTC.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function postTournamentScore(leaderboardId:String, score:int, data:Object, roundStartedTime:Date, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var reqData:Object = {
                "leaderboardId": leaderboardId,
                "score": score,
                "roundStartedEpoch": roundStartedTime.getTime()
            };		
            
            if (isOptionalParamValid(data)) {
                reqData.data = data;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.PostTournamentScore, reqData, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}    
        
        /**
         * Returns the user's expected reward based on the current scores
         *
         * Service Name - tournament
         * Service Operation - VIEW_CURRENT_REWARD
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function viewCurrentReward(leaderboardId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.ViewCurrentReward, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns the user's reward from a finished tournament
         *
         * Service Name - tournament
         * Service Operation - VIEW_REWARD
         *
         * @param leaderboardId The leaderboard for the tournament
         * @param versionId Version of the tournament. Use -1 for the latest version.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function viewReward(leaderboardId:String, versionId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "leaderboardId": leaderboardId,
                "versionId": versionId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Tournament, ServiceOperation.ViewReward, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}