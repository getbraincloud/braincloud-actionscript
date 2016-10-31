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
        
        /**
         * Sends an array of file details and returns
         * the details of any of those files that have changed
         *
         * Service Name - S3Handling
         * Service Operation - GetUpdatedFiles
         *
         * @param category Category of files on server to compare against
         * @param fileDetails An array of file details
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
        
        /**
         * Retreives the detailds of custom files stored on the server
         *
         * Service Name - S3Handling
         * Server Operation - GetFileList
         *
         * @param category Category of files to retrieve
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getFileList(category:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = new Object();	
            
            if (isOptionalParamValid(category)) {
                data.category = category;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.S3Handling, ServiceOperation.GetFileList, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns the CDN url for a file
         *
         * @param fileId ID of file
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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