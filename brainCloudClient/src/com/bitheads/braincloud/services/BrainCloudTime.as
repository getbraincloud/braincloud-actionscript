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
        
        public function readServerTime(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var serverCall:ServerCall = new ServerCall(ServiceName.Time, ServiceOperation.Read, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}