package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudMessaging extends BrainCloudService
    {                
        public function BrainCloudMessaging(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Deletes specified user messages on the server
         *
         * Service Name - messaging
         * Service Operation - DELETE_MESSAGES
         *
         * @param msgBox
         * @param msgIds
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteMessages(msgBox:String, msgIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "msgbox": msgBox,
                "msgIds": msgIds
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.DeleteMessages, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Retrieve users message boxes, including "inbox", "sent", etc. 
         *
         * Service Name - messaging
         * Service Operation - GET_MESSAGE_BOXES
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMessageBoxes(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {};
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.GetMessageBoxes, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Returns count of users 'total' messages and their unread messages. 
         *
         * Service Name - messaging
         * Service Operation - GET_MESSAGE_COUNTS
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMessageCounts(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {};
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.GetMessageCounts, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Retrieves list of specified messages
         *
         * Service Name - messaging
         * Service Operation - GET_MESSAGES
         *
         * @param msgBox 
         * @param msgIds 
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMessages(msgBox:String, msgIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "msgbox": msgBox,
                "msgIds": msgIds
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.GetMessages, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Retrieves page of messages
         *
         * Service Name - messaging
         * Service Operation - GET_MESSAGES_PAGE
         *
         * @param context
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMessagesPage(context:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var contextJson: Object = JSON.parse(context);
            var data:Object = {
                "context": contextJson
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.GetMessagesPage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Returns count of users total messages and unread messages
         *
         * Service Name - messaging
         * Service Operation - GET_MESSAGES_PAGE_OFFSET
         *
         * @param context
         * @param pageOffset
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMessagesPageOffset(context:String, pageOffset:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "context": context,
                "pageOffset": pageOffset
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.GetMessagesPageOffset, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Send messages to profiles
         *
         * Service Name - messaging
         * Service Operation - SEND_MESSAGE
         *
         * @param profileIds
         * @param contentJson
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendMessage(profileIds:Array, contentJson:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var content: Object = JSON.parse(contentJson);
            var data:Object = {
                "toProfileIds": profileIds,
                "contentJson" : content
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.SendMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Send messages to profiles
         *
         * Service Name - messaging
         * Service Operation - SEND_MESSAGE
         *
         * @param profileIds
         * @param messageText
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendMessageSimple(profileIds:Array, messageText:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "toProfileIds": profileIds,
                "text": messageText
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.SendMessageSimple, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Marks list of user messages as read on the server
         *
         * Service Name - messaging
         * Service Operation - MARK_MESSAGES_READ
         *
         * @param msgBox
         * @param msgIds
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function markMessagesRead(msgBox:String, msgIds:Array, markAsRead:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "msgbox": msgBox,
                "msgIds": msgIds,
                "markAsRead": markAsRead
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Messaging, ServiceOperation.MarkMessagesRead, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}