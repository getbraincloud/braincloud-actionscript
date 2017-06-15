package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudGlobalApp extends BrainCloudService
	{		        
        public function BrainCloudGlobalApp(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Read app's global properties
         *
         * Service Name - GlobalApp
         * Service Operation - ReadProperties
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readProperties(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalApp, ServiceOperation.ReadProperties, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}