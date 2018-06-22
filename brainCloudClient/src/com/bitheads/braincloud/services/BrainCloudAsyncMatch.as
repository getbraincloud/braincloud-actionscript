package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudAsyncMatch extends BrainCloudService
    {                
        public function BrainCloudAsyncMatch(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Creates an instance of an asynchronous match.
         *
         * Service Name - AsyncMatch
         * Service Operation - Create
         *
         * @param opponentIds  JSON string identifying the opponent platform and id for this match.
         *
         * Platforms are identified as:
         * BC - a brainCloud profile id
         * FB - a Facebook id
         *
         * An exmaple of this string would be:
         * [
         *     {
         *         "platform": "BC",
         *         "id": "some-braincloud-profile"
         *     },
         *     {
         *         "platform": "FB",
         *         "id": "some-facebook-id"
         *     }
         * ]
         *
         * @param pushNotificationMessage Optional push notification message to send to the other party.
         *  Refer to the Push Notification functions for the syntax required.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createMatch(opponentIds:Array, pushNotificationMessage:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            createMatchWithInitialTurn(opponentIds, null, pushNotificationMessage, null, null, successCallback, errorCallback, cbObject);
        }
        
        /**
         * Creates an instance of an asynchronous match with an initial turn.
         *
         * Service Name - AsyncMatch
         * Service Operation - Create
         *
         * @param opponentIds  JSON string identifying the opponent platform and id for this match.
         *
         * Platforms are identified as:
         * BC - a brainCloud profile id
         * FB - a Facebook id
         *
         * An exmaple of this string would be:
         * [
         *     {
         *         "platform": "BC",
         *         "id": "some-braincloud-profile"
         *     },
         *     {
         *         "platform": "FB",
         *         "id": "some-facebook-id"
         *     }
         * ]
         *
         * @param matchState    JSON string blob provided by the caller
         * @param pushNotificationMessage Optional push notification message to send to the other party.
         * Refer to the Push Notification functions for the syntax required.
         * @param nextPlayer Optionally, force the next player player to be a specific player
         * @param summary Optional JSON string defining what the other player will see as a summary of the game when listing their games
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createMatchWithInitialTurn(opponentIds:Array, matchState:Object, pushNotificationMessage:String, nextPlayer:String, summary:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "players": opponentIds
            };
            
            if (isOptionalParamValid(matchState)) {
                data.matchState = matchState;
            }  
            if (isOptionalParamValid(pushNotificationMessage)) {
                data.pushContent = pushNotificationMessage;
            } 
            if (isOptionalParamValid(nextPlayer)) {
                data.nextPlayer = nextPlayer;
            } 
            if (isOptionalParamValid(summary)) {
                data.summary = summary;
            }           
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.Create, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Submits a turn for the given match.
         *
         * Service Name - AsyncMatch
         * Service Operation - SubmitTurn
         *
         * @param ownerId Match owner identfier
         * @param matchId Match identifier
         * @param version Game state version to ensure turns are submitted once and in order
         * @param jsonMatchState JSON string provided by the caller
         * @param pushNotificationMessage Optional push notification message to send to the other party.
         *  Refer to the Push Notification functions for the syntax required.
         * @param nextPlayer Optionally, force the next player player to be a specific player
         * @param summary Optional JSON string that other players will see as a summary of the game when listing their games
         * @param statistics Optional JSON string blob provided by the caller
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function submitTurn(ownerId:String, matchId:String, version:int, matchState:Object, pushNotificationMessage:String, nextPlayer:String, summary:Object, statistics:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId,
                "version": version                
            };
            
            if (isOptionalParamValid(matchState)) {
                data.matchState = matchState;
            }  
            if (isOptionalParamValid(pushNotificationMessage)) {
                data.pushContent = pushNotificationMessage;
            } 
            if (isOptionalParamValid(nextPlayer)) {
                data.nextPlayer = nextPlayer;
            } 
            if (isOptionalParamValid(summary)) {
                data.summary = summary;
            }  
            if (isOptionalParamValid(statistics)) {
                data.statistics = statistics;
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.SubmitTurn, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Allows the current player (only) to update Summary data without having to submit a whole turn.
         *
         * Service Name - AsyncMatch
         * Service Operation - UpdateMatchSummary
         *
         * @param ownerId Match owner identfier
         * @param matchId Match identifier
         * @param version Game state version to ensure turns are submitted once and in order
         * @param summary JSON string that other players will see as a summary of the game when listing their games
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateMatchSummaryData(ownerId:String, matchId:String, version:int, summary:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId,
                "version": version,
                "summary": summary
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.UpdateSummary, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Marks the given match as complete.
         *
         * Service Name - AsyncMatch
         * Service Operation - Complete
         *
         * @param ownerId Match owner identifier
         * @param matchId Match identifier
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function completeMatch(ownerId:String, matchId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.CompleteMatch, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Returns the current state of the given match.
         *
         * Service Name - AsyncMatch
         * Service Operation - ReadMatch
         *
         * @param ownerId Match owner identifier
         * @param matchId Match identifier
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readMatch(ownerId:String, matchId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.ReadMatch, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Returns the match history of the given match.
         *
         * Service Name - AsyncMatch
         * Service Operation - ReadMatchHistory
         *
         * @param ownerId   Match owner identifier
         * @param matchId   Match identifier
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readMatchHistory(ownerId:String, matchId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.ReadMatchHistory, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Returns all matches that are NOT in a COMPLETE state for which the player is involved.
         *
         * Service Name - AsyncMatch
         * Service Operation - FindMatches
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findMatches(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.FindMatches, null, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Returns all matches that are in a COMPLETE state for which the player is involved.
         *
         * Service Name - AsyncMatch
         * Service Operation - FindMatchesCompleted
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findCompleteMatches(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {   
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.FindMatches, null, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Marks the given match as abandoned.
         *
         * Service Name - AsyncMatch
         * Service Operation - Abandon
         *
         * @param ownerId   Match owner identifier
         * @param matchId   Match identifier
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function abandonMatch(ownerId:String, matchId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.Abandon, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Removes the match and match history from the server. DEBUG ONLY, in production it is recommended
         *   the user leave it as completed.
         *
         * Service Name - AsyncMatch
         * Service Operation - Delete
         *
         * @param ownerId Match owner identifier
         * @param matchId Match identifier
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteMatch(ownerId:String, matchId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "ownerId": ownerId,
                "matchId": matchId
            };         
            
            var serverCall:ServerCall = new ServerCall(ServiceName.AsyncMatch, ServiceOperation.Delete, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}