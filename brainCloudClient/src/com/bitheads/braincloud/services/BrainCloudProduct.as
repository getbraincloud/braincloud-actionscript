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
        
        
        /**
         * Confirm Facebook Purchase. On success, the player will be awarded the
         * associated currencies.
         *
         * Service Name - Product
         * Service Operation - FB_CONFIRM_PURCHASE
         *
         * @param signedRequest Signed_request object received from Facebook
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function confirmFacebookPurchase(signedRequest:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "signed_request": signedRequest
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConfirmFacebookPurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Confirm GooglePlay Purchase. On success, the player will be awarded the
         * associated currencies.
         *
         * Service Name - product
         * Service Operation - CONFIRM_GOOGLEPLAY_PURCHASE
         *
         * @param orderId   GooglePlay order id
         * @param productId  GooglePlay product id
         * @param token   GooglePlay token string
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function confirmGooglePlayPurchase(orderId:String, productId:String, token:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "orderId": orderId,
                "productId": productId,
                "token": token
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConfirmGooglePlayPurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns the eligible promotions for the player.
         *
         * Service Name - Product
         * Service Operation - EligiblePromotions
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEligiblePromotions(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.EligiblePromotions, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method gets the active sales inventory for the passed-in
         * currency type.
         *
         * Service Name - Product
         * Service Operation - GetInventory
         *
         * @param platform The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
         * @param userCurrency The currency type to retrieve the sales inventory for.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSalesInventory(platform:String, userCurrency:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			getSalesInventoryByCategory(platform, userCurrency, null, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Method gets the active sales inventory for the passed-in
         * currency type.
         *
         * Service Name - Product
         * Service Operation - GetInventory
         *
         * @param platform The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
         * @param userCurrency The currency type to retrieve the sales inventory for.
         * @param category The product category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSalesInventoryByCategory(platform:String, userCurrency:String, category:String,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "platform": platform,
                "user_currency": userCurrency
            };	
            
            if (isOptionalParamValid(category)) {
                data.category = category;
            }
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetInventory, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Gets the player's currency for the given currency type
         * or all currency types if null passed in.
         *
         * Service Name Product
         * Service Operation GetPlayerVC
         *
         * @param currencyType The currency type to retrieve or null
         * if all currency types are being requested.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCurrency(currencyType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetPlayerVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}
