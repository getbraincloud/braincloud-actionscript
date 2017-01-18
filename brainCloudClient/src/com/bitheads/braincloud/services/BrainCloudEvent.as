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
         * @param eventId The event id
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteIncomingEvent(eventId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "evId": eventId
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.DeleteIncoming, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Get the events currently queued for the player.
         *
         * Service Name - Event
         * Service Operation - GetEvents
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEvents(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.GetEvents, null, successCallback, errorCallback, cbObject);
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
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendEvent(toPlayerId:String, eventType:String, eventData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toId": toPlayerId,
                "eventType": eventType,
                "eventData": eventData
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
         * @param eventId The event id
         * @param eventData The user-defined data for this event encoded in JSON.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateIncomingEventData(eventId:String, eventData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "evId": eventId,
                "eventData": eventData
            };		
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Event, ServiceOperation.UpdateEventData, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}