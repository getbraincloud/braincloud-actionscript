package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudCustomEntity extends BrainCloudService
    {                
        public function BrainCloudCustomEntity(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Creates custom entity
         *
         *
         * Service Name - customEntity
         * Service Operation - CREATE_ENTITY
         *
         * @param entityType
         * @param timeToLive
         * @param isOwned
         * @param dataJson
         * @param acl
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createEntity(entityType:String, dataJson:Object, acl:Object, timeToLive:Number, isOwned:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": eventName,
                "timeToLive": timeToLive,
                "isOwned":isOwned
            };
                data.dataJson  = dataJson;
                data.acl  = acl;
            
            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.CreateEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Delete the entity
         *
         * Service Name - customEntity
         * Service Operation - DELETE_ENTITY
         *
         * @param entityType
         * @param entityId
         * @param version
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteEntity(entityType:String, entityId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "entityId":entityId,
                "version":version
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.DeleteEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Counts the number of custom entities meeting the specified where clause, enforcing ownership/ACL permissions.
         *
         * Service Name - customEntity
         * Service Operation - GET_COUNT
         *
         * @param entityType
         * @param whereJson
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getCount(entityType:String, whereJson:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
            };
            
                data.whereJson  = whereJson;
            
            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.GetCount, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Retrieves first page of custom entities from the server based on the custom entity type and specified query context, enforcing ownership/ACL permissions.
         *
         * Service Name - customEntity
         * Service Operation - GET_PAGE
         *
         * @param entityType
         * @param rowsPerPage
         * @param searchJson
         * @param sortJson
         * @param doCount
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPage(entityType:String, rowsPerPage:int, searchJson:Object, sortJson:Object, doCount:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "rowsPerPage":rowsPerPage,
                "doCount": doCount
            };

            
                data.searchJson  = searchJson;
                data.sortJson  = sortJson;
            

            var serverCall:ServerCall = new ServerCall(ServiceName.customEntity, ServiceOperation.GetPage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

                /**
         * Gets the page of custom entities from the server based on the encoded context and specified page offset, enforcing ownership/ACL permissions.
         *
         * Service Name - customEntity
         * Service Operation - GET_PAGE_BY_OFFSET
         *
         * @param entityType
         * @param context
         * @param pageOffset
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPageOffset(entityType:String, context:String, pageOffset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "context":context,
                "pageOffset": pageOffset
            };
            

            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.GetPageOffset, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

                        /**
         * read entity data
         *
         * Service Name - customEntity
         * Service Operation - READ_ENTITY
         *
         * @param entityType
         * @param entityyId
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readEntity(entityType:String, entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "entityId":entityId
            };

            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.ReadEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

                        /**
         * Updates the entity
         *
         * Service Name - customEntity
         * Service Operation - UPDATE_ENTITY
         *
         * @param entityType
         * @param entityId
         * @param version
         * @param dataJson
         * @param acl
         * @param timeToLive
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntity(entityType:String, entityId:String, version:int, dataJson:Object, acl:Object, timeToLive:Number, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "entityId":entityId,
                "version": version,
                "timeToLive"=timeToLive
            };

            
                data.dataJson  = dataJson;
                data.acl  = acl;
            

            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.UpdateEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

                        /**
         * update entity fields
         *
         * Service Name - customEntity
         * Service Operation - UPDATE_ENTITY_FIELDS
         *
         * @param entityType
         * @param entityId
         * @param version
         * @param fieldsJson
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntityFields(entityType:String, entityId:String, version:int, fieldsJson:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "entityType": entityType,
                "entityId":entityId,
                "version": version
            };

            
                data.fieldsJson  = fieldsJson;
            

            var serverCall:ServerCall = new ServerCall(ServiceName.CustomEntity, ServiceOperation.updateEntityFields, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}
