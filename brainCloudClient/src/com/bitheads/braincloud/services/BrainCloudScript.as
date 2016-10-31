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
        
        /**
         * Executes a script on the server.
         *
         * Service Name - Script
         * Service Operation - Run
         *
         * @param scriptName The name of the script to be run
         * @param scriptData Data to be sent to the script in json format
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
        
        /**
         * Run a cloud script in a parent app
         *
         * Service Name - Script
         * Service Operation - RUN_PARENT_SCRIPT
         *
         * @param scriptName The name of the script to be run
         * @param scriptData Data to be sent to the script in json format
         * @param parentLevel The level name of the parent to run the script from
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
        
        /**
         * Allows cloud script executions to be scheduled
         *
         * Service Name - Script
         * Service Operation - ScheduleCloudScript
         *
         * @param scriptName The name of the script to be run
         * @param jsonScriptData JSON bundle to pass to script
         * @param startTimeUTC The start date as a Date object
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function scheduleRunScriptUTC(scriptName:String, scriptData:Object, startTimeUTC:Date, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "scriptName": scriptName,
                "startDateUTC": startTimeUTC.getTime()
            };		
            
            if (isOptionalParamValid(scriptData)) {
                data.scriptData = scriptData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Script, ServiceOperation.ScheduleCloudScript, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Allows cloud script executions to be scheduled
         *
         * Service Name - Script
         * Service Operation - ScheduleCloudScript
         *
         * @param scriptName The name of the script to be run
         * @param jsonScriptData JSON bundle to pass to script
         * @param minutesFromNow Number of minutes from now to run script
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function scheduleRunScriptMinutes(scriptName:String, scriptData:Object, minutesFromNow:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "scriptName": scriptName,
                "minutesFromNow": minutesFromNow
            };		
            
            if (isOptionalParamValid(scriptData)) {
                data.scriptData = scriptData;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Script, ServiceOperation.ScheduleCloudScript, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Cancels a scheduled cloud code script
         *
         * Service Name - Script
         * Service Operation - CANCEL_SCHEDULED_SCRIPT
         *
         * @param jobId The scheduled script job to cancel
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function cancelScheduledScript(jobId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "jobId": jobId
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Script, ServiceOperation.CancelScheduledScript, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}