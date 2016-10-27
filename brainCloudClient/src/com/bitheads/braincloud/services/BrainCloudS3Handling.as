package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudS3Handling extends BrainCloudService
	{		        
        public function BrainCloudS3Handling(client:BrainCloudClient) 
        {
            super(client);
        }
        
        public function getUpdatedFiles(category:String, fileDetails:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "fileDetails": fileDetails
            };		
            
            if (isOptionalParamValid(category)) {
                data.category = category;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.S3Handling, ServiceOperation.GetUpdatedFiles, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function getFileList(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = new Object();	
            
            if (isOptionalParamValid(category)) {
                data.category = category;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.S3Handling, ServiceOperation.GetFileList, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function getCDNUrl(fileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "fileId": fileId
            };	
			
			var serverCall:ServerCall = new ServerCall(ServiceName.S3Handling, ServiceOperation.GetCdnUrl, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}