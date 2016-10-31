package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudMatchMaking extends BrainCloudService
	{		        
        public function BrainCloudMatchMaking(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Read match making record
         *
         * Service Name - MatchMaking
         * Service Operation - Read
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function read(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sets player rating
         *
         * Service Name - MatchMaking
         * Service Operation - SetPlayerRating
         *
         * @param playerRating The new player rating.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function setPlayerRating(playerRating:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerRating": playerRating
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.SetPlayerRating, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Resets player rating
         *
         * Service Name - MatchMaking
         * Service Operation - ResetPlayerRating
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetPlayerRating(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.ResetPlayerRating, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Increments player rating
         *
         * Service Name - MatchMaking
         * Service Operation - IncrementPlayerRating
         *
         * @param increment The increment amount
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementPlayerRating(increment:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerRating": increment
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.IncrementPlayerRating, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Decrements player rating
         *
         * Service Name - MatchMaking
         * Service Operation - DecrementPlayerRating
         *
         * @param decrement The decrement amount
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function decrementPlayerRating(decrement:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerRating": decrement
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.DecrementPlayerRating, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Turns shield on
         *
         * Service Name - MatchMaking
         * Service Operation - ShieldOn
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function turnShieldOn(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.ShieldOn, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Turns shield on for the specified number of minutes
         *
         * Service Name - MatchMaking
         * Service Operation - ShieldOnFor
         *
         * @param minutes Number of minutes to turn the shield on for
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function turnShieldOnFor(minutes:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "minutes": minutes
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.ShieldOnFor, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Turns shield off
         *
         * Service Name - MatchMaking
         * Service Operation - ShieldOff
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function turnShieldOff(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.ShieldOn, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets the shield expiry for the given player id. Passing in a null player id
         * will return the shield expiry for the current player. The value returned is
         * the time in UTC millis when the shield will expire.
         *
         * Service Name - MatchMaking
         * Service Operation - GetShieldExpiry
         *
         * @param playerId The player id or use null to retrieve for the current player
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getShieldExpiry(playerId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playerId": playerId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.GetShieldExpiry, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Finds matchmaking enabled players
         *
         * Service Name - MatchMaking
         * Service Operation - FIND_PLAYERS
         *
         * @param rangeDelta The range delta
         * @param numMatches The maximum number of matches to return
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findPlayers(rangeDelta:int, numMatches:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			findPlayersWithAttributes(rangeDelta, numMatches, null, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Finds matchmaking enabled players with additional attributes
         *
         * Service Name - MatchMaking
         * Service Operation - FIND_PLAYERS
         *
         * @param rangeDelta The range delta
         * @param numMatches The maximum number of matches to return
         * @param attributes Attributes match criteria
         * @param callback The method to be invoked when the server response is received
         */
        public function findPlayersWithAttributes(rangeDelta:int, numMatches:int, attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "rangeDelta": rangeDelta,
                "numMatches": numMatches
            };
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.FindPlayers, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Finds matchmaking enabled players using a cloud code filter
         *
         * Service Name - MatchMaking
         * Service Operation - FIND_PLAYERS_USING_FILTER
         *
         * @param rangeDelta The range delta
         * @param numMatches The maximum number of matches to return
         * @param extraParms Other parameters
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function findPlayersUsingFilter(rangeDelta:int, numMatches:int, extraParms:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			findPlayersWithAttributesUsingFilter(rangeDelta, numMatches, null, extraParms, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Finds matchmaking enabled players using a cloud code filter
         * and additional attributes
         *
         * Service Name - MatchMaking
         * Service Operation - FIND_PLAYERS_USING_FILTER
         *
         * @param rangeDelta The range delta
         * @param numMatches The maximum number of matches to return
         * @param attributes Attributes match criteria
         * @param extraParms Parameters to pass to the CloudCode filter script
         * @param callback The method to be invoked when the server response is received
         */
        public function findPlayersWithAttributesUsingFilter(rangeDelta:int, numMatches:int, attributes:Object, extraParms:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "rangeDelta": rangeDelta,
                "numMatches": numMatches
            };
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
            
            if (isOptionalParamValid(extraParms)) {
                data.extraParms = extraParms;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.FindPlayersUsingFilter, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Enables Match Making for the Player
         *
         * Service Name - MatchMaking
         * Service Operation - ENABLE_FOR_MATCH
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function enableMatchMaking(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.EnableMatchMaking, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Disables Match Making for the Player
         *
         * Service Name - MatchMaking
         * Service Operation - DISABLE_FOR_MATCH
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function disableMatchMaking(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.MatchMaking, ServiceOperation.DisableMatchMaking, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}