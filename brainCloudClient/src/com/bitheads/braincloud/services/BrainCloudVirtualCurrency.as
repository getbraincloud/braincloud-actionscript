package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudVirtualCurrency extends BrainCloudService
	{		        
        public function BrainCloudVirtualCurrency(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Gets the player's currency for the given currency type
         * or all currency types if null passed in.
         *
         * Service Name VirtualCurrency
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
                "vcId": currencyType
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.GetPlayerVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Gets the player's currency for the given currency type
         * or all currency types if null passed in.
         *
         * Service Name VirtualCurrency
         * Service Operation GetParentVC
         *
         * @param currencyType The currency type to retrieve or null
		 * @param leveName The levelName of the parent
         * if all currency types are being requested.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getParentCurrency(currencyType:String, leveName:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vcId": currencyType,
				"levelName":leveName
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.GetParentVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
         * Gets the player's currency for the given currency type
         * or all currency types if null passed in.
         *
         * Service Name VirtualCurrency
         * Service Operation GetPeerVC
         *
         * @param currencyType The currency type to retrieve or null
		 * @param peerCode The peerCode of the peer
         * if all currency types are being requested.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPeerCurrency(currencyType:String, peerCode:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vcId": currencyType,
				"peerCode":peerCode
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.GetPeerVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * @deprecated Method is recommended to be used in Cloud Code only for security
		 * If you need to use it client side, enable 'Allow Currency Calls from Client' on the brainCloud dashboard
		 */
        public function awardCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vcId": currencyType,
                "vcAmount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.AwardVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
 
          
        /**
		 * @deprecated Method is recommended to be used in Cloud Code only for security
		 * If you need to use it client side, enable 'Allow Currency Calls from Client' on the brainCloud dashboard
		 */
        public function consumeCurrency(currencyType:String, amount:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "vcId": currencyType,
                "vcAmount":amount
            };	
            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.ConsumeVC, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		/**
		 * @deprecated Method is recommended to be used in Cloud Code only for security
		 * If you need to use it client side, enable 'Allow Currency Calls from Client' on the brainCloud dashboard
		 */
        public function resetCurrency(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{            
			var serverCall:ServerCall = new ServerCall(ServiceName.VirtualCurrency, ServiceOperation.ResetPlayerVC, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}
