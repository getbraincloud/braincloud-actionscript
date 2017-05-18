package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudMail extends BrainCloudService
	{		        
        public function BrainCloudMail(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Sends a simple text email to the specified player
         *
         * Service Name - mail
         * Service Operation - SEND_BASIC_EMAIL
         *
         * @param profileId The user to send the email to
         * @param subject The email subject
         * @param body The email body
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendBasicEmail(profileId:String, subject:String, body:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "subject": subject,
                "body": body
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Mail, ServiceOperation.SendBasicEmail, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Sends an advanced email to the specified player
         *
         * Service Name - mail
         * Service Operation - SEND_ADVANCED_EMAIL
         *
         * @param profileId The user to send the email to
         * @param serviceParams Parameters to send to the email service. See the documentation for
         *	a full list. http://getbraincloud.com/apidocs/apiref/#capi-mail
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sendAdvancedEmail(profileId:String, serviceParams:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "profileId": profileId,
                "serviceParams": serviceParams
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Mail, ServiceOperation.SendAdvancedEmail, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Sends an advanced email to the specified email address
         *
         * Service Name - mail
         * Service Operation - SEND_ADVANCED_EMAIL_BY_ADDRESS
         *
         * @param emailAddress The user to send the email to
         * @param serviceParams Parameters to send to the email service. See the documentation for
         *	a full list. http://getbraincloud.com/apidocs/apiref/#capi-mail
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
		public function sendAdvancedEmailByAddress(emailAddress:String, serviceParams:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "emailAddress": emailAddress,
                "serviceParams": serviceParams
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Mail, ServiceOperation.SendAdvancedEmailByAddress, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}