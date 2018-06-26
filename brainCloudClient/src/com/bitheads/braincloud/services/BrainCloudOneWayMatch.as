package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudOneWayMatch extends BrainCloudService
    {                
        public function BrainCloudOneWayMatch(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Starts a match
         *
         * Service Name - OneWayMatch 
         * Service Operation - StartMatch
         *
         * @param otherPlayerId The player to start a match with
         * @param rangeDeltaThe Range delta used for the initial match search
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function startMatch(otherPlayerId:String, rangeDelta:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "playerId": otherPlayerId,
                "rangeDelta": rangeDelta
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.OneWayMatch, ServiceOperation.StartMatch, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Cancels a match
         *
         * Service Name - OneWayMatch 
         * Service Operation - CancelMatch
         *
         * @param playbackStreamId The playback stream id returned in the start match
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function cancelMatch(playbackStreamId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "playbackStreamId": playbackStreamId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.OneWayMatch, ServiceOperation.CancelMatch, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Completes a match
         *
         * Service Name - OneWayMatch 
         * Service Operation - CompleteMatch
         *
         * @param playbackStreamId The playback stream id returned in the initial start match
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function completeMatch(playbackStreamId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "playbackStreamId": playbackStreamId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.OneWayMatch, ServiceOperation.CompleteMatch, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}