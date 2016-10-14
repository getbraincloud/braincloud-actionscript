package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudEvent extends BrainCloudService
	{		        
        public function BrainCloudEvent(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Delete an event out of the player's incoming mailbox.
         *
         * Service Name - Event
         * Service Operation - DeleteIncoming
         *
         * @param fromPlayerId The id of the player who sent the event
         * @param eventId The event id
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteIncomingEvent(fromPlayerId:String, eventId:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "fromId": fromPlayerId,
                "eventId": eventId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.DeleteIncoming, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Delete an event from the player's sent mailbox.
         *
         * Note that only events sent with the "recordLocally" flag
         * set to true will be added to a player's sent mailbox.
         *
         * Service Name - Event
         * Service Operation - DeleteSent
         *
         * @param toPlayerId The id of the player who is being sent the event
         * @param eventId The event id
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteSentEvent(toPlayerId:String, eventId:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toId": toPlayerId,
                "eventId": eventId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.DeleteSent, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Get the events currently queued for the player.
         *
         * Service Name - Event
         * Service Operation - GetEvents
         *
         * @param includeIncomingEvents Get events sent to the player
         * @param includeSentEvents Get events sent from the player
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEvents(includeIncomingEvents:Boolean, includeSentEvents:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "includeIncomingEvents": includeIncomingEvents,
                "includeSentEvents": includeSentEvents
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.GetEvents, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends an event to the designated player id with the attached json data.
         * Any events that have been sent to a player will show up in their
         * incoming event mailbox. If the recordLocally flag is set to true,
         * a copy of this event (with the exact same event id) will be stored
         * in the sending player's "sent" event mailbox.
         *
         * Note that the list of sent and incoming events for a player is returned
         * in the "ReadPlayerState" call (in the BrainCloudPlayer module).
         *
         * Service Name - Event
         * Service Operation - Send
         *
         * @param toPlayerId The id of the player who is being sent the event
         * @param eventType The user-defined type of the event.
         * @param eventData The user-defined data for this event encoded in JSON.
         * @param recordLocally If true, a copy of this event will be saved in the
         * user's sent events mailbox.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendEvent(toPlayerId:String, eventType:String, eventData:Object, recordLocally:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toId": toPlayerId,
                "eventType": eventType,
                "eventData": eventData,
                "recordLocally": recordLocally
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.Send, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Updates an event in the player's incoming event mailbox.
         *
         * Service Name - Event
         * Service Operation - UpdateEventData
         *
         * @param fromPlayerId The id of the player who sent the event
         * @param eventId The event id
         * @param eventData The user-defined data for this event encoded in JSON.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateIncomingEventData(fromPlayerId:String, eventId:uint, eventData:Object, recordLocally:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "fromId": fromPlayerId,
                "eventId": eventId,
                "eventData": eventData
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.UpdateEventData, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}