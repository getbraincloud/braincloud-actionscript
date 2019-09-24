package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	import com.bitheads.braincloud.types.AuthenticationType;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudUserItems
	{
		private var _client:BrainCloudClient;
		
		public function BrainCloudUserItems(client:BrainCloudClient)
		{
			_client = client;
		}
        
        /**
         * award/create item to user
         *
         * @param defId
         * @param quantity
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function AwardUserItem(defId:String, quantity:int, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		

            var data:Object = {
                "defId": defId,
                "quantity":quantity,
                "includeDef":includeDef
            };	


			var serverCall:ServerCall = new ServerCall(ServiceName.UserItems, ServiceOperation.AwardUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * drop item
         *
         * @param defId
         * @param quantity
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function dropUserItem(defId:String, quantity:int, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{			

            var data:Object = {
                "defId": defId,
                "quantity":quantity,
                "includeDef":includeDef
            };		
			var serverCall:ServerCall = new ServerCall(ServiceName.UserItems, ServiceOperation.DropUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * get user item
         *
         * @param itemId
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getUserItem(itemId:String, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				
			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.GetUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * Retrieves the page of user's inventory from the server based on the context. If includeDef is true, response includes associated itemDef with each user item, with language fields limited to the current or default language.
         *
         * @param context
         * @param searchCriteria
         * @param sortCriteria
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getUserItemsPage(context:Object, searchCriteria:Object, sortCriteria:Object, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{			

            var data:Object = {
                "includeDef":includeDef
            };		

            data.context  = context;
            data.searchCriteria = searchCriteria;
            data.sortCriteria  = sortCriteria;

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.GetUserItemsPage, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         *Retrieves the page of user's inventory from the server based on the encoded context. If includeDef is true, response includes associated itemDef with each user item, with language fields limited to the current or default language.
         *
         * @param context
         * @param pageOffset
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getUserItemsPageOffset(context:String, pageOffset:int, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{			

            var data:Object = {
                "context":context,
                "pageOffset":pageOffset,
                "includeDef":includeDef
            };

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.GetUserItemsPageOffset, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * give item
         *
         * @param profileId
         * @param itemId
         * @param version
         * @param quantity
         * @param immediate
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function giveUserItemTo(profileId:String, itemId:String, version:int, quantity:int, immediate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "profileId":profileId,
                "itemId":itemId,
                "version":version,
                "quantity":quantity,
                "immediate":immediate
            };

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.GiveUserItemTo, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * Purchase item
         *
         * @param defId
         * @param quantity
         * @param shopId
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function purchaseUserItem(defId:String, quantity:int, shopId:Object, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		

            var data:Object = {
                "defId":defId,
                "quantity":quantity,
                "includeDef":includeDef
            };		

            data.shopId=shopId;

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.PurchaseUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * receive item from user
         *
         * @param profileId
         * @param itemId
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function receiveUserItemFrom(profileId:String, itemId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{	
            var data:Object = {
                "profileId":profileId,
                "itemId":itemId
            }

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.ReceiveUserItemFrom, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

		        /**
         * sell item
         *
         * @param itemId
         * @param version
         * @param quantity
         * @param shopId
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function sellUserItem(itemId:String, version:int, quantity:int, shopId:Object, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{	

            var data:Object = {
                "itemId":itemId,
                "version":version,
                "quantity":quantity,
                "includeDef":includeDef
            }			

            data.shopId=shopId;
            
			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.SellUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * update item data
         *
         * @param itemId
         * @param version
         * @param newItemData
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateUserItemData(itemId:String, version:int, newItemData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{				

            var data:Object = {
                "itemId": itemId,
                "version":version
            };	

            data.newItemData  = newItemData;

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.UpdateUserItemData, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}

        		        /**
         * uses item.
         *
         * @param itemId
         * @param version
         * @param newItemData
         * @param includeDef
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function useUserItem(itemId:String, version:int, newItemData:Object, includeDef:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		

            var data:Object = {
                "itemId": itemId,
                "version":version,
                "includeDef":includeDef
            };	

            data.newItemData  = newItemData;

			var serverCall:ServerCall = new ServerCall(ServiceName.UserItem, ServiceOperation.UseUserItem, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
	}
}
