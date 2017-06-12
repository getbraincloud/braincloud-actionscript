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
         * Deregisters all device tokens currently registered to the user.
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
         * @param toProfileId The braincloud profileId of the user to receive the notification
         * @param message Text of the push notification
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendSimplePushNotification(toProfileId:String, message:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toProfileId,
                "message": message
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendSimple, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a user based on a brainCloud portal configured notification template.
         * NOTE: It is possible to send a push notification to oneself.
         *
         * @param toProfileId The braincloud profileId of the user to receive the notification
         * @param notificationTemplateId Id of the notification template
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendRichPushNotification(toProfileId:String, notificationTemplateId:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			sendRichPushNotificationWithParams(toProfileId, notificationTemplateId, null, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Sends a notification to a user based on a brainCloud portal configured notification template.
         * Includes JSON defining the substitution params to use with the template.
         * See the Portal documentation for more info.
         * NOTE: It is possible to send a push notification to oneself.
         *
         * @param toProfileId The braincloud profileId of the user to receive the notification
         * @param notificationTemplateId Id of the notification template
         * @param substitutionJson JSON defining the substitution params to use with the template
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendRichPushNotificationWithParams(toProfileId:String, notificationTemplateId:int, substitutionJson:String, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toProfileId,
                "notificationTemplateId": notificationTemplateId
            };
            
            if (isOptionalParamValid(substitutionJson)) {
                data.substitutions = substitutionJson;
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
         * @param substitutionJson Map of substitution positions to strings
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendTemplatedPushNotificationToGroup(groupId:String, notificationTemplateId:int, substitutionJson:String, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "groupId": groupId,
                "notificationTemplateId": notificationTemplateId
            };
            
            if (isOptionalParamValid(substitutionJson)) {
                data.substitutions = substitutionJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendTemplatedToGroup, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends a notification to a "group" of user consisting of alert content and custom data.
         * See the Portal documentation for more info.
         *
         * @param groupId Target group
         * @param alertContentJson Body and title of alert
         * @param customDataJson Optional custom data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendNormalizedPushNotificationToGroup(groupId:String, alertContentJson:Object, customDataJson:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "groupId": groupId,
                "alertContent": alertContentJson
            };
            
            if (isOptionalParamValid(customDataJson)) {
                data.customData = customDataJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendNormalizedToGroup, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		
        /**
		* Schedules a normalized push notification to a user
		*
		* @param profileId The profileId of the user to receive the notification
		* @param alertContentJson Body and title of alert
		* @param customDataJson Optional custom data
		* @param startTime Start time of sending the push notification
		* @param callback The method to be invoked when the server response is received
		*/
        public function scheduleNormalizedPushNotificationUTC(profileId:String, alertContentJson:Object, customDataJson:Object, startTime:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "alertContent": alertContentJson,
				"startDateUTC" : startTime
            };
            
            if (isOptionalParamValid(customDataJson)) {
                data.customData = customDataJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.ScheduleNormalizedNotification, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		
        /**
		* Schedules a normalized push notification to a user
		*
		* @param profileId The profileId of the user to receive the notification
		* @param alertContentJson Body and title of alert
		* @param customDataJson Optional custom data
		* @param minutesFromNow Minutes from now to send the push notification
		* @param callback The method to be invoked when the server response is received
		*/
        public function scheduleNormalizedPushNotificationMinutes(profileId:String, alertContentJson:Object, customDataJson:Object, minutesFromNow:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "alertContent": alertContentJson,
				"minutesFromNow" : minutesFromNow
            };
            
            if (isOptionalParamValid(customDataJson)) {
                data.customData = customDataJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.ScheduleNormalizedNotification, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		
        /**
		* Schedules a rich push notification to a user
		*
		* @param profileId The profileId of the user to receive the notification
		* @param notificationTemplateId Body and title of alert
		* @param substitutionJson JSON defining the substitution params to use with the template
		* @param startTime Start time of sending the push notification
		* @param callback The method to be invoked when the server response is received
		*/
        public function scheduleRichPushNotificationUTC(profileId:String, notificationTemplateId:int, substitutionJson:Object, startTime:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "notificationTemplateId": notificationTemplateId,
				"startDateUTC" : startTime
            };
            
            if (isOptionalParamValid(substitutionJson)) {
                data.substitutions = substitutionJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.ScheduleRichNotification, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		
        /**
		* Schedules a rich push notification to a user
		*
		* @param profileId The profileId of the user to receive the notification
		* @param notificationTemplateId Body and title of alert
		* @param substitutionJson JSON defining the substitution params to use with the template
		* @param minutesFromNow Minutes from now to send the push notification
		* @param callback The method to be invoked when the server response is received
		*/
        public function scheduleRichPushNotificationMinutes(profileId:String, notificationTemplateId:int, substitutionJson:Object, minutesFromNow:int,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "notificationTemplateId": notificationTemplateId,
				"minutesFromNow" : minutesFromNow
            };
            
            if (isOptionalParamValid(substitutionJson)) {
                data.substitutions = substitutionJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.ScheduleRichNotification, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
      
        /**
         * Sends a notification to a user consisting of alert content and custom data.
         *
         * @param toProfileId The profileId of the user to receive the notification
         * @param alertContentJson Body and title of alert
         * @param customDataJson Optional custom data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendNormalizedPushNotification(toProfileId:String, alertContentJson:Object, customDataJson:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "toPlayerId": toProfileId,
                "alertContent": alertContentJson
            };
            
            if (isOptionalParamValid(customDataJson)) {
                data.customData = customDataJson;
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
        public function sendNormalizedPushNotificationBatch(profileIds:Array, alertContentJson:Object, customDataJson:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileIds": profileIds,
                "alertContent": alertContentJson
            };
            
            if (isOptionalParamValid(customDataJson)) {
                data.customData = customDataJson;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.PushNotification, ServiceOperation.SendNormalizedBatch, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}