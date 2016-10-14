package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudProduct extends BrainCloudService
	{		        
        public function BrainCloudProduct(client:BrainCloudClient) 
        {
            super(client);
        }
        
        public function awardCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.AwardVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function awardParentCurrency(currencyType:String, amount:uint, parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount": amount,
                "levelName": parentLevel
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.AwardParentVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function confirmFacebookPurchase(signedRequest:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "signed_request": signedRequest
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConfirmFacebookPurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function consumeCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConsumeVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function consumeParentCurrency(currencyType:String, amount:uint, parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount":amount,
                "levelName": parentLevel
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConsumeParentVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function getCurrency(currencyType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetPlayerVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function getParentCurrency(currencyType:String, parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "levelName": parentLevel
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetParentVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function getSalesInventory(platform:String, userCurrency:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "platform": platform,
                "user_currency": userCurrency
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetInventory, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function resetCurrency(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ResetPlayerVC, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        public function resetParentCurrency(parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{      
			var data:Object = {
                "levelName": parentLevel
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ResetParentVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}