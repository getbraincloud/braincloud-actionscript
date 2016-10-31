package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudTime extends BrainCloudService
	{		        
        public function BrainCloudTime(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Method returns the server time in UTC. This is in UNIX millis time format.
         * For instance 1396378241893 represents 2014-04-01 2:50:41.893 in GMT-4.
         *
         * Server API reference: ServiceName.Time, ServiceOperation.Read
         *
         * Service Name - Time
         * Service Operation - Read
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readServerTime(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.Time, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}