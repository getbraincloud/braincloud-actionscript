package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.types.ACL;
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudChat extends BrainCloudService
    {                
        public function BrainCloudChat(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
        * Registers a listener for incoming events from <channelId>.
        * Also returns a list of <maxReturn> recent messages from history.
        *
        * Service Name - Chat
        * Service Operation - ChannelConnect
        *
        * @param channelId The id of the chat channel to return history from.
        * @param maxReturn Maximum number of messages to return.
        * @param callback The method to be invoked when the server response is received
        */
        public function channelConnect(channelId:String, maxReturn:int,  successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "maxReturn": maxReturn
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.ChannelConnect, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Unregisters a listener for incoming events from <channelId>.
        *
        * Service Name - Chat
        * Service Operation - channelDisconnect
        *
        * @param channelId The id of the chat channel to unsubscribed from.
        * @param callback The method to be invoked when the server response is received
        */
        public function channelDisconnect(channelId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.ChannelDisconnect, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Delete a chat message. <version> must match the latest or pass -1 to bypass version check.
        *
        * Service Name - Chat
        * Service Operation - deleteChatMessage
        *
        * @param channelId The id of the chat channel that contains the message to delete.
        * @param msgId The message id to delete.
        * @param version Version of the message to delete. Must match latest or pass -1 to bypass version check.
        * @param callback The method to be invoked when the server response is received
        */
        public function deleteChatMessage(channelId:String, msgId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "msgId": msgId,
                "version": version
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.DeleteChatMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Gets the channelId for the given <channelType> and <channelSubId>. Channel type must be one of "gl" or "gr".
        *
        * Service Name - Chat
        * Service Operation - getChannelId
        *
        * @param channelType Channel type must be one of "gl" or "gr". For (global) or (group) respectively.
        * @param channelSubId The sub id of the channel.
        * @param callback The method to be invoked when the server response is received
        */
        public function getChannelId(channelType:String, channelSubId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelType": channelType,
                "channelSubId": channelSubId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.GetChannelId, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Gets description info and activity stats for channel <channelId>.
        * Note that numMsgs and listeners only returned for non-global groups.
        * Only callable for channels the user is a member of.
        *
        * Service Name - Chat
        * Service Operation - getChannelInfo
        *
        * @param channelId Id of the channel to receive the info from.
        * @param callback The method to be invoked when the server response is received.
        */
        public function getChannelInfo(channelId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.GetChannelInfo, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Gets a populated chat object (normally for editing).
        *
        * Service Name - Chat
        * Service Operation - getChatMessage
        *
        * @param channelId Id of the channel to receive the message from.
        * @param msgId Id of the message to read.
        * @param callback The method to be invoked when the server response is received.
        */
        public function getChatMessage(channelId:String, msgId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "msgId": msgId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.GetChatMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Get a list of <maxReturn> messages from history of channel <channelId>.
        *
        * Service Name - Chat
        * Service Operation - getRecentMessages
        *
        * @param channelId Id of the channel to receive the info from.
        * @param maxReturn Maximum message count to return.
        * @param callback The method to be invoked when the server response is received.
        */
        public function getRecentMessages(channelId:String, maxReturn:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "maxReturn": maxReturn
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.GetRecentMessages, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Gets a list of the channels of type <channelType> that the user has access to.
        * Channel type must be one of "gl", "gr" or "all".
        *
        * Service Name - Chat
        * Service Operation - getSubscribedChannels
        *
        * @param channelType Type of channels to get back. "gl" for global, "gr" for group or "all" for both.
        * @param callback The method to be invoked when the server response is received.
        */
        public function getSubscribedChannels(channelType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelType": channelType
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.GetSubscribedChannels, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Send a potentially rich chat message.
        * <content> must contain at least a "text" field for text messaging.
        *
        * Service Name - Chat
        * Service Operation - postChatMessage
        *
        * @param channelId Channel id to post message to.
        * @param content the text message.
        * @param rich custom data.
        * @param recordInHistory true if the message persist in history
        * @param callback The method to be invoked when the server response is received.
        */
        public function postChatMessage(channelId:String, content:Object, recordInHistory:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "content": {
                    "plain": plain,
                    "rich": (rich == null) ? {} : rich
                },
                "recordInHistory": recordInHistory
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.PostChatMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Send a potentially rich chat message.
        * <content> must contain at least a "text" field for text messaging.
        *
        * Service Name - Chat
        * Service Operation - postChatMessage
        *
        * @param channelId Channel id to post message to.
        * @param content the text message.
        * @param rich custom data.
        * @param recordInHistory true if the message persist in history
        * @param callback The method to be invoked when the server response is received.
        */
        public function postChatMessageSimple(channelId:String, text:String, recordInHistory:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "content": {
                    "text": text
                },
                "recordInHistory": recordInHistory
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.PostChatMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
        * Update a chat message.
        * <content> must contain at least a "plain" field for plain-text messaging.
        * <version> must match the latest or pass -1 to bypass version check.
        *
        * Service Name - Chat
        * Service Operation - updateChatMessage
        *
        * @param channelId Channel id where the message to update is.
        * @param msgId Message id to update.
        * @param version Version of the message to update. Must match latest or pass -1 to bypass version check.
        * @param plain the text message.
        * @param rich custom data.
        * @param callback The method to be invoked when the server response is received.
        */
        public function updateChatMessage(channelId:String, msgId:String, version:int, plain:String, rich:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "channelId": channelId,
                "msgId": msgId,
                "version": version,
                "content": {
                    "plain": plain,
                    "rich": (rich == null) ? {} : rich
                }
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Chat, ServiceOperation.UpdateChatMessage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}
