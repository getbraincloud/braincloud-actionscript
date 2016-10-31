package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudPushNotification extends BrainCloudService
	{		        
        public function BrainCloudPushNotification(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Deregisters all device tokens currently registered to the player.
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deregisterAllPushNotificationDeviceTokens(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.DeregisterAll, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Deregisters the given device token from the server to disable this device
         * from receiving push notifications.
         *
         * @param platform The device platform being deregistered.
         * @param token The platform-dependant device token needed for push notifications.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deregisterPushNotificationDeviceToken(platform:String, token:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "platform": platform,
                "token": token
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.Deregister, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Registers the given device token with the server to enable this device
         * to receive push notifications.
         *
         * @param platform The device platform
         * @param token The platform-dependant device token needed for push notifications.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function registerPushNotificationToken(platform:String, token:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "platform": platform,
                "token": token
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.Register, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a simple push notification based on the passed in message.
         * NOTE: It is possible to send a push notification to oneself.
         *
         * @param toPlayerId The braincloud playerId of the user to receive the notification
         * @param message Text of the push notification
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendSimplePushNotification(toPlayerId:String, message:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toPlayerId,
                "message": message
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendSimple, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a user based on a brainCloud portal configured notification template.
         * NOTE: It is possible to send a push notification to oneself.
         *
         * @param toPlayerId The braincloud playerId of the user to receive the notification
         * @param notificationTemplateId Id of the notification template
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendRichPushNotification(toPlayerId:String, notificationTemplateId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			sendRichPushNotificationWithParams(toPlayerId, notificationTemplateId, null, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Sends a notification to a user based on a brainCloud portal configured notification template.
         * Includes JSON defining the substitution params to use with the template.
         * See the Portal documentation for more info.
         * NOTE: It is possible to send a push notification to oneself.
         *
         * @param toPlayerId The braincloud playerId of the user to receive the notification
         * @param notificationTemplateId Id of the notification template
         * @param substitutions JSON defining the substitution params to use with the template
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendRichPushNotificationWithParams(toPlayerId:String, notificationTemplateId:int, substitutions:String, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toPlayerId,
                "notificationTemplateId": notificationTemplateId
            };
            
            if (isOptionalParamValid(substitutions)) {
                data.substitutions = substitutions;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendRich, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a "group" of user based on a brainCloud portal configured notification template.
         * Includes JSON defining the substitution params to use with the template.
         * See the Portal documentation for more info.
         *
         * @param groupId Target group
         * @param notificationTemplateId Template to use
         * @param substitutions Map of substitution positions to strings
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendTemplatedPushNotificationToGroup(groupId:String, notificationTemplateId:int, substitutions:String, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "groupId": groupId,
                "notificationTemplateId": notificationTemplateId
            };
            
            if (isOptionalParamValid(substitutions)) {
                data.substitutions = substitutions;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendTemplatedToGroup, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a "group" of user consisting of alert content and custom data.
         * See the Portal documentation for more info.
         *
         * @param groupId Target group
         * @param alertContent Body and title of alert
         * @param customData Optional custom data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendNormalizedPushNotificationToGroup(groupId:String, alertContent:Object, customData:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "groupId": groupId,
                "alertContent": alertContent
            };
            
            if (isOptionalParamValid(customData)) {
                data.customData = customData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendNormalizedToGroup, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a user consisting of alert content and custom data.
         *
         * @param toPlayerId The playerId of the user to receive the notification
         * @param alertContentJson Body and title of alert
         * @param customDataJson Optional custom data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendNormalizedPushNotification(toPlayerId:String, alertContent:Object, customData:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toPlayerId,
                "alertContent": alertContent
            };
            
            if (isOptionalParamValid(customData)) {
                data.customData = customData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendNormalized, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to multiple users consisting of alert content and custom data.
         *
         * @param profileIds Collection of profile IDs to send the notification to
         * @param alertContentJson Body and title of alert
         * @param customDataJson Optional custom data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendNormalizedPushNotificationBatch(profileIds:Array, alertContent:Object, customData:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileIds": profileIds,
                "alertContent": alertContent
            };
            
            if (isOptionalParamValid(customData)) {
                data.customData = customData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendNormalizedBatch, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}