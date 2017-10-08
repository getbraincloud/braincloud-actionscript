package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
    import com.bitheads.braincloud.types.ACL;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudGlobalEntity extends BrainCloudService
	{		        
        public function BrainCloudGlobalEntity(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Method creates a new entity on the server.
         *
         * Service Name - globalEntity
         * Service Operation - CREATE
         *
         * @param entityType The entity type as defined by the user
         * @param timeToLive Sets expiry time in millis for entity if > 0
         * @param entityAcl The entity's access control list as json. A null acl implies default
         * @param entityData The entity's data as a json String
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createEntity(entityType:String, timeToLive:int, entityAcl:ACL, entityData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityType": entityType,
                "timeToLive": timeToLive,
                "data": entityData
            };
            
            if (isOptionalParamValid(entityAcl)) {
                data.acl = entityAcl.toObject();
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.Create, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
                
        /**
         * Method creates a new entity on the server with an indexed id.
         *
         * Service Name - globalEntity
         * Service Operation - CREATE_WITH_INDEXED_ID
         *
         * @param entityType The entity type as defined by the user
         * @param indexedId A secondary ID that will be indexed
         * @param timeToLive Sets expiry time in millis for entity if > 0
         * @param entityAcl The entity's access control list as json. A null acl implies default
         * @param entityData The entity's data as a json String
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createEntityWithIndexedId(entityType:String, indexedId:String, timeToLive:int, entityAcl:ACL, entityData:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityType": entityType,
                "indexedId": indexedId,
                "timeToLive": timeToLive,
                "data": entityData
            };
            
            if (isOptionalParamValid(entityAcl)) {
                data.acl = entityAcl.toObject();
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.CreateWithIndexedId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
                
        /**
         * Method updates an existing entity on the server.
         *
         * Service Name - globalEntity
         * Service Operation - UPDATE
         *
         * @param entityId The entity ID
         * @param version Current version of the entity. If the version of the entity on
         *            the server does not match the version passed in, the server
         *            operation will fail. Use -1 to skip version checking.
         * @param entityData The entity's data as a json String
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntity(entityId:String, version:int, entityData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version,
                "data": entityData
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.Update, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method updates an existing entity's ACL on the server.
         *
         * Service Name - globalEntity
         * Service Operation - UPDATE_ACL
         *
         * @param entityId The entity ID
         * @param version Current version of the entity. If the version of the entity on
         *            the server does not match the version passed in, the server
         *            operation will fail. Use -1 to skip version checking.
         * @param entityAcl The entity's access control list as json.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntityAcl(entityId:String, version:int, entityAcl:ACL, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version,
                "acl": entityAcl.toObject()
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.UpdateAcl, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}        
        
        /**
         * Method updates an existing entity's time to live on the server.
         *
         * Service Name - globalEntity
         * Service Operation - UPDATE_TIME_TO_LIVE
         *
         * @param entityId The entity ID
         * @param version Current version of the entity. If the version of the entity on
         *            the server does not match the version passed in, the server
         *            operation will fail. Use -1 to skip version checking.
         * @param timeToLive Sets expiry time in millis for entity if > 0
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntityTimeToLive(entityId:String, version:int, timeToLive:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version,
                "timeToLive": timeToLive
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.UpdateTimeToLive, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method deletes an existing entity on the server.
         *
         * Service Name - globalEntity
         * Service Operation - DELETE
         *
         * @param entityId The entity ID
         * @param version The version of the entity to delete
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteEntity(entityId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.Delete, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method reads an existing entity from the server.
         *
         * Service Name - globalEntity
         * Service Operation - READ
         *
         * @param entityId The entity ID
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readEntity(entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.Read, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method gets list of entities from the server base on type and/or where clause
         *
         * Service Name - globalEntity
         * Service Operation - GET_LIST
         *
         * @param where Mongo style query string
         * @param orderBy Specifies the order in which the query returns matching
         *            documents. The sort parameter consists of a field followed by
         *            an ascending(1)/descending flag(-1). eg. { name : 1} sorts by
         *            name in ascending order
         * @param maxReturn The maximum number of entities to return
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getList(where:Object, orderBy:Object, maxReturn:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "maxReturn": maxReturn
            };
            
            if (isOptionalParamValid(where)) {
                data.where = where;
            }
            
            if (isOptionalParamValid(orderBy)) {
                data.orderBy = orderBy;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.GetList, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method gets list of entities from the server base on indexed id
         *
         * Service Name - globalEntity
         * Service Operation - GET_LIST_BY_INDEXED_ID
         *
         * @param entityIndexedId The entity indexed Id
         * @param maxReturn The maximum number of entities to return
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getListByIndexedId(entityIndexedId:String, maxReturn:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "indexedId": entityIndexedId,
                "maxReturn": maxReturn
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.GetListByIndexedId, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method gets a count of entities based on the where clause
         *
         * Service Name - globalEntity
         * Service Operation - GET_LIST_COUNT
         *
         * @param where Mongo style query string
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getListCount(where:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "where": where
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.GetListCount, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}   
        
        /**
         * Method uses a paging system to iterate through Global Entities.
         * After retrieving a page of Global Entities with this method,
         * use GetPageOffset() to retrieve previous or next pages.
         *
         * Service Name - globalEntity
         * Service Operation - GET_PAGE
         *
         * @param context The json context for the page request.
         * See the portal appendix documentation for format
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPage(context:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "context": context
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.GetPage, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method to retrieve previous or next pages after having called
         * the GetPage method.
         *
         * Service Name - globalEntity
         * Service Operation - GET_PAGE_BY_OFFSET
         *
         * @param context The context string returned from the server from a previous call
         * @param pageOffset The positive or negative page offset to fetch. Uses the last page
         * retrieved using the context string to determine a starting point.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getPageOffset(context:String, pageOffset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "context": context,
                "pageOffset": pageOffset
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.GetPageOffset, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Partial increment of entity data field items. Partial set of items incremented as specified.
         *
         * Service Name - globalEntity
         * Service Operation - INCREMENT_GLOBAL_ENTITY_DATA
         *
         * @param entityId The id of the entity to update
         * @param data The entity's data object
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementGlobalEntityData(entityId:String, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var dataObj:Object = {
                "entityId": entityId,
                "data": data
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.IncrementGlobalEntityData, dataObj, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
		
		
		/**
		* Gets a list of up to randomCount randomly selected entities from the server based on the where condition and specified maximum return count.
		*
		* Service Name - globalEntity
		* Service Operation - GET_RANDOM_ENTITIES_MATCHING
		*
		* @param where Mongo style query string
		* @param maxReturn The maximum number of entities to return
		* @param callback The callback object
		*/
        public function getRandomEntitiesMatching(where:Object, maxReturn:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var dataObj:Object = {
                "maxReturn": maxReturn
            };
			
			
            if (isOptionalParamValid(where)) {
                dataObj.where = where;
            }
            
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.GetRandomEntitiesMatching, dataObj, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method updates an existing entity's Owner and ACL on the server.
         *
         * Service Name - globalEntity
         * Service Operation - UPDATE_ENTITY_OWNER_AND_ACL
         *
         * @param entityId The entity ID
         * @param version The version of the entity to update
         * @param ownerId The owner ID
         * @param acl The entity's access control list as JSON.
         * @param cbObject The user object sent to the callback
         */
        public function updateEntityOwnerAndAcl(entityId:String, version:int, ownerId:String, acl:ACL, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version,
                "ownerId": ownerId,
                "acl": acl.toObject()
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.UpdateEntityOwnerAndAcl, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Method clears the owner id of an existing entity and sets the ACL on the server.
         *
         * Service Name - globalEntity
         * Service Operation - MAKE_SYSTEM_ENTITY
         *
         * @param entityId The entity ID
         * @param version The version of the entity to update
         * @param acl The entity's access control list as JSON.
         * @param cbObject The user object sent to the callback
         */
        public function makeSystemEntity(entityId:String, version:int, acl:ACL, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "entityId": entityId,
                "version": version,
                "acl": acl.toObject()
            };
			
			var serverCall:ServerCall = new ServerCall(ServiceName.GlobalEntity, ServiceOperation.MakeSystemEntity, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}