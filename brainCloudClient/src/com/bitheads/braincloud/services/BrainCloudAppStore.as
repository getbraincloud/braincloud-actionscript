package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudAppStore extends BrainCloudService
	{		        
        public function BrainCloudAppStore(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Verifies that purchase was properly made at the store.
         *
         * Service Name - AppStore
         * Service Operation - VerifyPurchase
         *
		 * @param storeId The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
		 * @param receiptData the specific store data required
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function verifyPurchase(storeId:String, receiptData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "storeId": storeId,
				"receiptData" : receiptData
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.AppStore, ServiceOperation.VerifyPurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Returns the eligible promotions for the player.
         *
         * Service Name - AppStore
         * Service Operation - EligiblePromotions
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEligiblePromotions(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{            
			var serverCall:ServerCall = new ServerCall(ServiceName.AppStore, ServiceOperation.EligiblePromotions, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method gets the active sales inventory for the passed-in
         * currency type.
         *
         * Service Name - AppStore
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
         * @param priceInfoCriteria The currency type to retrieve the sales inventory for.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSalesInventory(storeId:String, priceInfoCriteria:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			getSalesInventoryByCategory(storeId, priceInfoCriteria, null, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Method gets the active sales inventory for the passed-in
         * currency type.
         *
         * Service Name - AppStore
         * Service Operation - GetInventory
         *
         * @param storeId The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
         * @param priceInfoCriteria The currency type to retrieve the sales inventory for.
         * @param category The product category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSalesInventoryByCategory(storeId:String, priceInfoCriteria:Object, category:String,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "storeId": storeId,
                "priceInfoCriteria": priceInfoCriteria
            };	
            
            if (isOptionalParamValid(category)) {
                data.category = category;
            }
            
			var serverCall:ServerCall = new ServerCall(ServiceName.AppStore, ServiceOperation.GetInventory, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Start A Two Staged Purchase Transaction
         *
         * Service Name - AppStore
         * Service Operation - StartPurchase
         *
         * @param storeId The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
         * @param purchaseData specific data for purchasing 2 staged purchases
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function startPurchase(storeId:String, purchaseData:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "storeId": storeId,
                "purchaseData": purchaseData
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.AppStore, ServiceOperation.StartPurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Finalize A Two Staged Purchase Transaction
         *
         * Service Name - AppStore
         * Service Operation - FinalizePurchase
         *
         * @param storeId The store platform. Valid stores are:
         * - itunes
         * - facebook
         * - appworld
         * - steam
         * - windows
         * - windowsPhone
         * - googlePlay
		 * @param transactionId the transactionId returned from start Purchase
         * @param transactionData specific data for purchasing 2 staged purchases
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function finalizePurchase(storeId:String, transactionId:String, transactionData:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "storeId": storeId,
				"transactionId" : transactionId,
                "transactionData": transactionData
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.AppStore, ServiceOperation.FinalizePurchase, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}
