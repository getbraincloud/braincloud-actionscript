package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	import com.bitheads.braincloud.types.AuthenticationType;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudItemCatalog
	{
		private var _client:BrainCloudClient;
		
		public function BrainCloudItemCatalog(client:BrainCloudClient)
		{
			_client = client;
		}
        
        /**
         *Reads an existing item definition from the server, with language fields limited to the current or default language.
         *
         * @param defId
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCatalogItemDefinition(defId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		

            var data:Object = {
                "defId": defId
            };	


			var serverCall:ServerCall = new ServerCall(ServiceName.ItemCatalog, ServiceOperation.GetCatalogItemDefinition, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Retrieves page of catalog items from the server, with language fields limited to the text for the current or default language.
         *
         * @param context
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCatalogItemsPage(context:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{			

            data.context  = context;

			var serverCall:ServerCall = new ServerCall(ServiceName.ItemCatalog, ServiceOperation.GetCatalogItemsPage, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
        
        /**
         * Gets the page of catalog items from the server based on the encoded context and specified page offset, with language fields limited to the text for the current or default language.
         *
         * @param context
         * @param pageOffset
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCatalogItemsPageOffset(context:String, pageOffset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{		
            var data:Object = {
                "context": context,
                "pageOffset":pageOffset
            };	

			var serverCall:ServerCall = new ServerCall(ServiceName.ItemCatalog, ServiceOperation.GetCatalogItemsPageOffset, data, successCallback, errorCallback, cbObject);
			_client.sendRequest(serverCall);
		}
	}
}
