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
         * Award player the passed-in amount of currency. Returns
         * JSON representing the new currency values.
         *
         * Service Name - Product
         * Service Operation - AwardVC
         *
         * @param currencyType The currency type to award.
         * @param amount The amount of currency to award.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function awardCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.AwardVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Awards currency in a parent app.
         *
         * Service Name - Product
         * Service Operation - AWARD_PARENT_VC
         *
         * @param currencyType The ID of the parent currency
         * @param amount The amount of currency to award
         * @param parentLevel The level of the parent containing the currency
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
         * Consume the passed-in amount of currency from the player.
         *
         * Service Name - Product
         * Service Operation - ConsumePlayerVC
         *
         * @param currencyType The currency type to consume.
         * @param amount The amount of currency to consume.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function consumeCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "vc_amount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ConsumeVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Consumes currency in a parent app.
         *
         * Service Name - Product
         * Service Operation - CONSUME_PARENT_VC
         *
         * @param currencyType The ID of the parent currency
         * @param amount The amount of currency to consume
         * @param parentLevel The level of the parent containing the currency
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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
        
        /**
         * Gets the player's currency for the given currency type
         * or all currency types if null passed in.
         *
         * Service Name - Product
         * Service Operation - GetPlayerVC
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
         * Gets information on a currency in a parent app.
         *
         * Service Name - Product
         * Service Operation - GET_PARENT_VC
         *
         * @param currencyType The ID of the parent currency or null to retrieve all parent currencies
         * @param parentLevel The level of the parent containing the currency
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getParentCurrency(currencyType:String, parentLevel:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vc_id": currencyType,
                "levelName": parentLevel
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.GetParentVC, data, successCallback, errorCallback, cbObject);
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
         * Resets the player's currency back to zero.
         *
         * Service Name - Product
         * Service Operation - ResetPlayerVC
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetCurrency(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{            
			var serverCall:ServerCall = new ServerCall(ServiceName.Product, ServiceOperation.ResetPlayerVC, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Resets all currencies in a parent app.
         *
         * Service Name - Product
         * Service Operation - RESET_PARENT_VC
         *
         * @param parentLevel The level of the parent containing the currencies
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
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