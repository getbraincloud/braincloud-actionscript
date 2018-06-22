package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.types.ACL;
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudEntity extends BrainCloudService
    {                
        public function BrainCloudEntity(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Method creates a new entity on the server.
         *
         * Service Name - Entity
         * Service Operation - Create
         *
         * @param entityType The entity type as defined by the user
         * @param jsonEntityData The entity's data as a json string
         * @param jsonEntityAcl The entity's access control list as json. A null acl implies default
         * permissions which make the entity readable/writeable by only the player.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createEntity(entityType:String, entityData:Object, entityAcl:ACL, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityType": entityType, 
                "data": entityData        
            };
            
            if (isOptionalParamValid(entityAcl)) {
                data.acl = entityAcl.toObject();
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.Create, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method deletes the given entity on the server.
         *
         * Service Name - Entity
         * Service Operation - Delete
         *
         * @param entityId The id of the entity to update
         * @param version Current version of the entity. If the version of the
         * entity on the server does not match the version passed in, the
         * server operation will fail. Use -1 to skip version checking.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteEntity(entityId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityId": entityId, 
                "version": version        
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.Delete, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method deletes the given singleton entity on the server.
         *
         * Service Name - Entity
         * Service Operation - DeleteSingleton
         *
         * @param entityType The type of the entity to delete
         * @param version Current version of the entity. If the version of the
         * entity on the server does not match the version passed in, the
         * server operation will fail. Use -1 to skip version checking.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteSingleton(entityType:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityType": entityType, 
                "version": version        
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.DeleteSingleton, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /** Method returns all player entities that match the given type.
         * Service Name - Entity
         * Service Operation - ReadByType
         *
         * @param entityType The entity type to search for
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEntitiesByType(entityType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityType": entityType
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadByType, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /** Method to get a specific entity.
         *
         * Service Name - Entity
         * Service Operation - Read
         *
         * @param entityId The entity id
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getEntity(entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityId": entityId      
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.Read, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method gets list of entities from the server base on type and/or where clause
         *
         * Service Name - Entity
         * Service Operation - GET_LIST
         *
         * @param where Mongo style query string
         * @param orderBy Sort order
         * @param maxReturn The maximum number of entities to return
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getList(where:Object, orderBy:Object, maxReturn:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "maxReturn": maxReturn  
            };
            
            if (isOptionalParamValid(where)) {
                data.where = where;
            }    
            
            if (isOptionalParamValid(orderBy)) {
                data.orderBy = orderBy;
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.GetList, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method gets a count of entities based on the where clause
         *
         * Service Name - Entity
         * Service Operation - GET_LIST_COUNT
         *
         * @param where Mongo style query string
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getListCount(where:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "where": where  
            };            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.GetListCount, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method uses a paging system to iterate through user entities
         * After retrieving a page of entities with this method,
         * use GetPageOffset() to retrieve previous or next pages.
         *
         * Service Name - Entity
         * Service Operation - GetPage
         *
         * @param context The json context for the page request.
         *                   See the portal appendix documentation for format.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPage(context:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "context": context
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.GetPage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method to retrieve previous or next pages after having called the GetPage method.
         *
         * Service Name - Entity
         * Service Operation - GetPageOffset
         *
         * @param context The context string returned from the server from a
         *      previous call to GetPage or GetPageOffset
         * @param pageOffset The positive or negative page offset to fetch. Uses the last page
         *      retrieved using the context string to determine a starting point.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPageOffset(context:Object, pageOffset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "context": context,
                "pageOffset": pageOffset
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.GetPageOffset, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * @deprecated Use getSharedEntityForProfileId instead - removal after September 1 2017
         */
        public function getSharedEntityForPlayerId(profileId:String, entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId,
                "entityId": entityId
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadSharedEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method returns a shared entity for the given player and entity ID.
         * An entity is shared if its ACL allows for the currently logged
         * in player to read the data.
         *
         * Service Name - Entity
         * Service Operation - READ_SHARED_ENTITY
         *
         * @param profileId The the profile ID of the player who owns the entity
         * @param entityId The ID of the entity that will be retrieved
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSharedEntityForProfileId(profileId:String, entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId,
                "entityId": entityId
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadSharedEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * @deprecated Use getSharedEntitiesForProfileId instead - removal after September 1 2017
         */
        public function getSharedEntitiesForPlayerId(profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadShared, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method returns all shared entities for the given profile id.
         * An entity is shared if its ACL allows for the currently logged
         * in user to read the data.
         *
         * Service Name - Entity
         * Service Operation - ReadShared
         *
         * @param profileId The profile id to retrieve shared entities for
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSharedEntitiesForProfileId(profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadShared, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * @deprecated Use getSharedEntitiesListForProfileId instead - removal after September 1 2017
         */
        public function getSharedEntitiesListForPlayerId(profileId:String, where:Object, orderBy:Object, maxReturn:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId,
                "maxReturn": maxReturn
            };    
            
            if (isOptionalParamValid(where)) {
                data.where = where;
            }    
            
            if (isOptionalParamValid(orderBy)) {
                data.orderBy = orderBy;
            }    
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadSharedEntitesList, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method gets list of shared entities for the specified user based on type and/or where clause
         *
         * Service Name - Entity
         * Service Operation - READ_SHARED_ENTITIES_LIST
         *
         * @param profileId The profile ID to retrieve shared entities for
         * @param where Mongo style query
         * @param orderBy Sort order
         * @param maxReturn The maximum number of entities to return
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSharedEntitiesListForProfileId(profileId:String, where:Object, orderBy:Object, maxReturn:uint, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "playerId": profileId,
                "maxReturn": maxReturn
            };    
            
            if (isOptionalParamValid(where)) {
                data.where = where;
            }    
            
            if (isOptionalParamValid(orderBy)) {
                data.orderBy = orderBy;
            }    
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadSharedEntitesList, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /** Method retreives a singleton entity on the server. If the entity doesn't exist, null is returned.
         *
         * Service Name - Entity
         * Service Operation - ReadSingleton
         *
         * @param entityType The entity type as defined by the user
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getSingleton(entityType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityType": entityType
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.ReadSingleton, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }       

        /**
         * Partial increment of entity data field items. Partial set of items incremented as specified.
         *
         * Service Name - entity
         * Service Operation - INCREMENT_USER_ENTITY_DATA
         *
         * @param entityId The id of the entity to update
         * @param data The entity's data object
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementUserEntityData(entityId:String, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var reqData:Object = {
                "entityId": entityId, 
                "data": data        
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.IncrementUserEntityData, reqData, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Partial increment of entity data field items. Partial set of items incremented as specified.
         *
         * Service Name - entity
         * Service Operation - INCREMENT_SHARED_USER_ENTITY_DATA
         *
         * @param entityId The id of the entity to update
         * @param targetProfileId Profile ID of the entity owner
         * @param data The entity's data object
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementSharedUserEntityData(entityId:String, targetProfileId:String, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var reqData:Object = {
                "entityId": entityId, 
                "targetPlayerId": targetProfileId,
                "data": data        
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.IncrementSharedUserEntityData, reqData, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method updates a new entity on the server. This operation results in the entity
         * data being completely replaced by the passed in JSON string.
         *
         * Service Name - Entity
         * Service Operation - Update
         *
         * @param entityId The id of the entity to update
         * @param entityType The entity type as defined by the user
         * @param entityData The entity's data as a json string.
         * @param entityAcl The entity's access control list as json. A null acl implies default
         * permissions which make the entity readable/writeable by only the player.
         * @param version Current version of the entity. If the version of the
         * entity on the server does not match the version passed in, the
         * server operation will fail. Use -1 to skip version checking.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntity(entityId:String, entityType:String, entityData:Object, entityAcl:ACL, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityId": entityId, 
                "entityType": entityType,
                "version": version
            };
            
            if (isOptionalParamValid(entityData)) {
                data.data = entityData;
            }    
            
            if (isOptionalParamValid(entityAcl)) {
                data.acl = entityAcl.toObject();
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method updates a new singleton entity on the server. This operation results in the entity
         * data being completely replaced by the passed in JSON string. If the entity doesn't exists it is created
         *
         * Service Name - Entity
         * Service Operation - UpdateSingleton
         *
         * @param entityType The entity type as defined by the user
         * @param entityData  The entity's data as a json string.
         * permissions which make the entity readable/writeable by only the player.
         * @param entityAcl The entity's access control list as json. A null acl implies default
         * permissions which make the entity readable/writeable by only the player.
         * @param version Current version of the entity. If the version of the
         * entity on the server does not match the version passed in, the
         * server operation will fail. Use -1 to skip version checking.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateSingleton(entityType:String, entityData:Object, entityAcl:ACL, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityType": entityType, 
                "version": version 
            };
            
            if (isOptionalParamValid(entityData)) {
                data.data = entityData;
            }    
            
            if (isOptionalParamValid(entityAcl)) {
                data.acl = entityAcl.toObject();
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.UpdateSingleton, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method updates a shared entity owned by another player. This operation results in the entity
         * data being completely replaced by the passed in JSON string.
         *
         * Service Name - Entity
         * Service Operation - UpdateShared
         *
         * @param entityId The id of the entity to update
         * @param targetProfileId The id of the player who owns the shared entity
         * @param entityType The entity type as defined by the user
         * @param entityData The entity's data as a json string.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateSharedEntity(entityId:String, targetProfileId:String, entityType:String, entityData:Object, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object;
            data = {
                "entityId": entityId, 
                "targetPlayerId": targetProfileId,
                "entityType": entityType,
                "version": version
            };
            
            if (isOptionalParamValid(entityData)) {
                data.data = entityData;
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Entity, ServiceOperation.UpdateShared, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}