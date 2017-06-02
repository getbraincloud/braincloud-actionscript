package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudPlaybackStream extends BrainCloudService
	{		        
        public function BrainCloudPlaybackStream(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Starts a stream
         *
         * Service Name - PlaybackStream
         * Service Operation - START_STREAM
         *
         * @param targetPlayerId The player to start a stream with
         * @param includeSharedData Whether to include shared data in the stream
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function startStream(targetPlayerId:String, includeSharedData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "targetPlayerId": targetPlayerId,
                "includeSharedData": includeSharedData
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.StartStream, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Reads a stream
         *
         * Service Name - PlaybackStream
         * Service Operation - READ_STREAM
         *
         * @param playbackStreamId Identifies the stream to read
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readStream(playbackStreamId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playbackStreamId": playbackStreamId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.ReadStream, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Ends a stream
         *
         * Service Name - PlaybackStream
         * Service Operation - END_STREAM
         *
         * @param in_playbackStreamId Identifies the stream to read
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function endStream(playbackStreamId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playbackStreamId": playbackStreamId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.EndStream, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Deletes a stream
         *
         * Service Name - PlaybackStream
         * Service Operation - DELETE_STREAM
         *
         * @param playbackStreamId Identifies the stream to read
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteStream(playbackStreamId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playbackStreamId": playbackStreamId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.DeleteStream, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Adds a stream event
         *
         * Service Name - PlaybackStream
         * Service Operation - ADD_EVENT
         *
         * @param playbackStreamId Identifies the stream to read
         * @param eventData Describes the event
         * @param summary Current summary data as of this event
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function addEvent(playbackStreamId:String, eventData:Object, summary:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "playbackStreamId": playbackStreamId,
                "eventData": eventData,
                "summary": summary
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.AddEvent, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets stream summaries for initiating player
         *
         * Service Name - PlaybackStream
         * Service Operation - GET_STREAM_SUMMARIES_FOR_INITIATING_PLAYER
         *
         * @param initiatingPlayerId The player that started the stream
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getStreamSummariesForInitiatingPlayer(initiatingPlayerId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "initiatingPlayerId": initiatingPlayerId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.GetStreamSummariesForInitiatingPlayer, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Gets stream summaries for target player
         *
         * Service Name - PlaybackStream
         * Service Operation - GET_STREAM_SUMMARIES_FOR_TARGET_PLAYER
         *
         * @param targetPlayerId The player that started the stream
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getStreamSummariesForTargetPlayer(targetPlayerId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "targetPlayerId": targetPlayerId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.GetStreamSummariesForTargetPlayer, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * Gets recent stream summaries for initiating player
		 *
		 * Service Name - PlaybackStream
		 * Service Operation - GetRecentStreamsForInitiatingPlayer
		 *
		 * @param initiatingPlayerId The player that started the stream
		 * @param maxNumStreams The max number of streams to query
		 * @param callback The callback.
		 */
		public function getRecentStreamsForInitiatingPlayer(initiatingPlayerId:String, maxNumStreams:Number, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "initiatingPlayerId": initiatingPlayerId,
				"maxNumStreams" : maxNumStreams
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.GetRecentStreamsForInitiatingPlayer, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * Gets recent stream summaries for target player
		 *
		 * Service Name - PlaybackStream
		 * Service Operation - GetRecentStreamsForTargetPlayer
		 *
		 * @param targetPlayerId The player that was target of the stream
		 * @param maxNumStreams The max number of streams to query
		 * @param callback The callback.
		 */
		public function getRecentStreamsForTargetPlayer(targetPlayerId:String, maxNumStreams:Number, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "targetPlayerId": targetPlayerId,
				"maxNumStreams" : maxNumStreams
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PlaybackStream, ServiceOperation.GetRecentStreamsForTargetPlayer, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}