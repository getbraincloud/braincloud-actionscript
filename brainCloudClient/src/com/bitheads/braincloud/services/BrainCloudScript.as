package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudScript extends BrainCloudService
	{		        
        public function BrainCloudScript(client:BrainCloudClient) 
        {
            super(client);
        }
        
        public function runScript(scriptName:String, scriptData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "scriptName": scriptName  
            };		
            
            if (isOptionalParamValid(scriptData)) {
                data.scriptData = scriptData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Script, ServiceOperation.Run, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function runParentScript(scriptName:String, scriptData:Object, parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "scriptName": scriptName,
                "parentLevel": parentLevel
            };		
            
            if (isOptionalParamValid(scriptData)) {
                data.scriptData = scriptData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Script, ServiceOperation.RunParentScript, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}