package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    import com.bitheads.braincloud.types.GroupACL;
    import com.bitheads.braincloud.types.AutoJoinStrategy;
    import com.bitheads.braincloud.types.Role;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudGroup extends BrainCloudService
    {                
        public function BrainCloudGroup(client:BrainCloudClient) 
        {
            super(client);
        }
        /**
         * Accept an outstanding invitation to join the group.
         *
         * Service Name - group
         * Service Operation - ACCEPT_GROUP_INVITATION
         *
         * @param groupId ID of the group.
         * @param successCallback The success callbackupdateGroupMember
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function acceptGroupInvitation(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId  
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.AcceptGroupInvitation, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Add a member to the group.
         *
         * Service Name - group
         * Service Operation - ACCEPT_GROUP_INVITATION
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the member being added.
         * @param role Role of the member being added.
         * @param attributes Attributes of the member being added.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function addMemberToGroup(groupId:String, profileId:String, role:Role, attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId,
                "role": role.value
            };
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.AcceptGroupInvitation, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Approve an outstanding request to join the group.
         *
         * Service Name - group
         * Service Operation - APPROVE_GROUP_JOIN_REQUEST
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the invitation being deleted.
         * @param role Role of the member being invited.
         * @param attributes Attributes of the member being invited.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function approveGroupJoinRequest(groupId:String, profileId:String, role:Role, attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId,
                "role": role.value
            };
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.AcceptGroupInvitation, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Automatically join an open group that matches the search criteria and has space available.
         *
         * Service Name - group
         * Service Operation - AUTO_JOIN_GROUP
         *
         * @param groupType Name of the associated group type.
         * @param autoJoinStrategy Selection strategy to employ when there are multiple matches
         * @param dataQuery Query parameters (optional)
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function autoJoinGroup(groupType:String, autoJoinStrategy:AutoJoinStrategy, dataQuery:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupType": groupType,
                "autoJoinStrategy": autoJoinStrategy.value
            };
            
            if (isOptionalParamValid(dataQuery)) {
                data.where = dataQuery;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.AutoJoinGroup, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Find and join an open group in the pool of groups in multiple group types provided as input arguments.
         *
         * Service Name - group
         * Service Operation - AUTO_JOIN_GROUP_MULTI
         *
         * @param groupType Name of the associated group type.
         * @param autoJoinStrategy Selection strategy to employ when there are multiple matches
         * @param dataQuery Query parameters (optional)
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function autoJoinGroupMulti(groupType:String, autoJoinStrategy:AutoJoinStrategy, dataQuery:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupType": groupType,
                "autoJoinStrategy": autoJoinStrategy.value
            };
            
            if (isOptionalParamValid(dataQuery)) {
                data.where = dataQuery;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.AutoJoinGroupMulti, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Cancel an outstanding invitation to the group.
         *
         * Service Name - group
         * Service Operation - CANCEL_GROUP_INVITATION
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the invitation being deleted.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function cancelGroupInvitation(groupId:String, profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.CancelGroupInvitation, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Create a group.
         *
         * Service Name - group
         * Service Operation - CREATE_GROUP
         *
         * @param name Name of the group.
         * @param groupType Name of the type of group.
         * @param isOpenGroup true if group is open; false if closed.
         * @param acl The group's access control list. A null ACL implies default.
         * @param ownerAttributes Attributes for the group owner (current player).
         * @param defaultMemberAttributes Default attributes for group members.
         * @param data Custom application data.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createGroup(name:String, groupType:String, isOpenGroup:Boolean, acl:GroupACL, ownerAttributes:Object, defaultMemberAttributes:Object, data:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupType": groupType
            };
            
            if (isOptionalParamValid(name)) {
                dataObj.name = name;
            }
            
            if (isOptionalParamValid(isOpenGroup)) {
                dataObj.isOpenGroup = isOpenGroup;
            }
            
            if (isOptionalParamValid(acl)) {
                dataObj.acl = acl.toObject();
            }
            
            if (isOptionalParamValid(ownerAttributes)) {
                dataObj.ownerAttributes = ownerAttributes;
            }
            
            if (isOptionalParamValid(defaultMemberAttributes)) {
                dataObj.defaultMemberAttributes = defaultMemberAttributes;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.CreateGroup, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Create a group with summaryData.
         *
         * Service Name - group
         * Service Operation - CREATE_GROUP
         *
         * @param name Name of the group.
         * @param groupType Name of the type of group.
         * @param isOpenGroup true if group is open; false if closed.
         * @param acl The group's access control list. A null ACL implies default.
         * @param ownerAttributes Attributes for the group owner (current player).
         * @param defaultMemberAttributes Default attributes for group members.
         * @param data Custom application data.
         * @param jsonSummaryData summary
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createGroupWithSummaryData(name:String, groupType:String, isOpenGroup:Boolean, acl:GroupACL, ownerAttributes:Object, defaultMemberAttributes:Object, data:Object, jsonSummaryData:Object, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupType": groupType
            };
            
            if (isOptionalParamValid(name)) {
                dataObj.name = name;
            }
            
            if (isOptionalParamValid(isOpenGroup)) {
                dataObj.isOpenGroup = isOpenGroup;
            }
            
            if (isOptionalParamValid(acl)) {
                dataObj.acl = acl.toObject();
            }
            
            if (isOptionalParamValid(ownerAttributes)) {
                dataObj.ownerAttributes = ownerAttributes;
            }
            
            if (isOptionalParamValid(defaultMemberAttributes)) {
                dataObj.defaultMemberAttributes = defaultMemberAttributes;
            }

            if (isOptionalParamValid(jsonSummaryData)) {
                dataObj.summaryData = jsonSummaryData;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.CreateGroup, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Create a group entity.
         *
         * Service Name - group
         * Service Operation - CREATE_GROUP_ENTITY
         *
         * @param groupId ID of the group.
         * @param isOwnedByGroupMember true if entity is owned by a member; false if owned by the entire group.
         * @param entityType Type of the group entity.
         * @param acl Access control list for the group entity.
         * @param data Custom application data.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function createGroupEntity(groupId:String, isOwnedByGroupMember:Boolean, entityType:String, acl:GroupACL, data:Object,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId
            };
            
            if (isOptionalParamValid(entityType)) {
                dataObj.entityType = entityType;
            }
            
            if (isOptionalParamValid(isOwnedByGroupMember)) {
                dataObj.isOwnedByGroupMember = isOwnedByGroupMember;
            }
            
            if (isOptionalParamValid(acl)) {
                dataObj.acl = acl.toObject();
            }
            
            if (isOptionalParamValid(data)) {
                dataObj.data = data;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.CreateGroupEntity, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Delete a group.
         *
         * Service Name - group
         * Service Operation - DELETE_GROUP
         *
         * @param groupId ID of the group.
         * @param version Current version of the group
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteGroup(groupId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "version": version
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.DeleteGroup, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Delete a group entity.
         *
         * Service Name - group
         * Service Operation - DELETE_GROUP_ENTITY
         *
         * @param groupId ID of the group.
         * @param entityId ID of the entity.
         * @param version The current version of the group entity (for concurrency checking).
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function deleteGroupEntity(groupId:String, entityId:String, version:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "version": version
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.DeleteGroupEntity, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read information on groups to which the current player belongs.
         *
         * Service Name - group
         * Service Operation - GET_MY_GROUPS
         * 
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getMyGroups(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.GetMyGroups, null, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Increment elements for the group's data field.
         *
         * Service Name - group
         * Service Operation - INCREMENT_GROUP_DATA
         *
         * @param groupId ID of the group.
         * @param data Partial data map with incremental values.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementGroupData(groupId:String, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "data": data
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.IncrementGroupData, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Increment elements for the group entity's data field.
         *
         * Service Name - group
         * Service Operation - INCREMENT_GROUP_ENTITY_DATA
         *
         * @param groupId ID of the group.
         * @param entityId ID of the entity.
         * @param data Partial data map with incremental values.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function incrementGroupEntityData(groupId:String, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "data": data
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.IncrementGlobalEntityData, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Invite a member to the group.
         *
         * Service Name - group
         * Service Operation - INVITE_GROUP_MEMBER
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the member being invited.
         * @param role Role of the member being invited.
         * @param attributes Attributes of the member being invited.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function inviteGroupMember(groupId:String, profileId:String, role:Role, attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId
            };
            
            if (isOptionalParamValid(role)) {
                data.role = role.value;
            }
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.InviteGroupMember, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Join an open group or request to join a closed group.
         *
         * Service Name - group
         * Service Operation - JOIN_GROUP
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function joinGroup(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.JoinGroup, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Leave a group in which the player is a member.
         *
         * Service Name - group
         * Service Operation - LEAVE_GROUP
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function leaveGroup(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.LeaveGroup, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read a page of group information.
         *
         * Service Name - group
         * Service Operation - LIST_GROUPS_PAGE
         *
         * @param context Query context.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function listGroupsPage(context:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "context": context
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ListGroupsPage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read a page of group information.
         *
         * Service Name - group
         * Service Operation - LIST_GROUPS_PAGE_BY_OFFSET
         *
         * @param encodedContext Encoded reference query context.
         * @param offset Number of pages by which to offset the query.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function listGroupsPageByOffset(encodedContext:String, offset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "context": encodedContext,
                "offset": offset
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ListGroupsPageByOffset, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read information on groups to which the specified player belongs.  Access is subject to restrictions.
         *
         * Service Name - group
         * Service Operation - LIST_GROUPS_WITH_MEMBER
         *
         * @param profileId
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function listGroupsWithMember(profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "profileId": profileId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ListGroupsWithMember, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read the specified group.
         *
         * Service Name - group
         * Service Operation - READ_GROUP
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroup(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroup, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read the data of the specified group.
         *
         * Service Name - group
         * Service Operation - READ_GROUP_DATA
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroupData(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroupData, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read a page of group entity information.
         *
         * Service Name - group
         * Service Operation - READ_GROUP_ENTITIES_PAGE
         *
         * @param context Query context.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroupEntitiesPage(context:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "context": context
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroupEntitiesPage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read a page of group entity information.
         *
         * Service Name - group
         * Service Operation - READ_GROUP_ENTITIES_PAGE_BY_OFFSET
         *
         * @param encodedContext Encoded reference query context.
         * @param offset Number of pages by which to offset the query.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroupEntitiesPageByOffset(encodedContext:String, offset:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "context": encodedContext,
                "offset": offset
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroupEntitiesPageByOffset, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read the specified group entity.
         *
         * Service Name - group
         * Service Operation - READ_GROUP_ENTITY
         *
         * @param groupId ID of the group.
         * @param entityId ID of the entity.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroupEntity(groupId:String, entityId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "entityId": entityId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroupEntity, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read the members of the group.
         *
         * Service Name - group
         * Service Operation - READ_MEMBERS_OF_GROUP
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readGroupMembers(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.ReadGroupMembers, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Reject an outstanding invitation to join the group.
         *
         * Service Name - group
         * Service Operation - REJECT_GROUP_INVITATION
         *
         * @param groupId ID of the group.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function rejectGroupInvitation(groupId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.RejectGroupInvitation, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Reject an outstanding request to join the group.
         *
         * Service Name - group
         * Service Operation - REJECT_GROUP_JOIN_REQUEST
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the invitation being deleted.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function rejectGroupJoinRequest(groupId:String, profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.RejectGroupJoinRequest, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Remove a member from the group.
         *
         * Service Name - group
         * Service Operation - REMOVE_GROUP_MEMBER
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the member being deleted.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function removeGroupMember(groupId:String, profileId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.RemoveGroupMember, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Updates a group's data.
         *
         * Service Name - group
         * Service Operation - UPDATE_GROUP_DATA
         *
         * @param groupId ID of the group.
         * @param version Version to verify.
         * @param data Data to apply.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateGroupData(groupId:String, version:int, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "version": version,
                "data": data
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.UpdateGroupData, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Update a group entity.
         *
         * Service Name - group
         * Service Operation - UPDATE_GROUP_ENTITY_DATA
         *
         * @param groupId ID of the group.
         * @param entityId ID of the entity.
         * @param version The current version of the group entity (for concurrency checking).
         * @param data Custom application data.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateGroupEntityData(groupId:String, entityId:String, version:int, data:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var dataObj:Object = {
                "groupId": groupId,
                "entityId": entityId,
                "version": version,
                "data": data
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.UpdateGroupEntity, dataObj, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Update a member of the group.
         *
         * Service Name - group
         * Service Operation - UPDATE_GROUP_MEMBER
         *
         * @param groupId ID of the group.
         * @param profileId Profile ID of the member being updated.
         * @param role Role of the member being updated (optional).
         * @param attributes Attributes of the member being updated (optional).
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateGroupMember(groupId:String, profileId:String, role:Role, attributes:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "profileId": profileId
            };
            
            if (isOptionalParamValid(role)) {
                data.role = role.value;
            }
            
            if (isOptionalParamValid(attributes)) {
                data.attributes = attributes;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.UpdateGroupMember, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Updates a group's name.
         *
         * Service Name - group
         * Service Operation - UPDATE_GROUP_NAME
         *
         * @param groupId ID of the group.
         * @param name Name to apply.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateGroupName(groupId:String, name:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "name": name
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.UpdateGroupName, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * make the group open true or false.
         *
         * Service Name - group
         * Service Operation - SET_GROUP_OPEN
         *
         * @param groupId ID of the group.
         * @param isOpenGroup whether or not the group is open.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function setGroupOpen(groupId:String, isOpenGroup:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "isOpenGroup": isOpenGroup
            };
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.SetGroupOpen, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Update group's summary data
         *
         * Service Name - group
         * Service Operation - UPDATE_GROUP_SUMMARY_DATA
         *
         * @param groupId ID of the group.
         * @param version the version
         * @param jsonSummaryData the summary
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function updateGroupSummaryData(groupId:String, version:int, jsonSummaryData:Object, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "groupId": groupId,
                "version": version
            };
            if (isOptionalParamValid(jsonSummaryData)) {
                data.summaryData = jsonSummaryData;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.UpdateGroupSummaryData, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }

        /**
         * Gets a list up to maxReturn randomly selected groups from the server based on the where param
         *
         * Service Name - group
         * Service Operation - GET_RANDOM_GROUPS_MATCHING
         *
         * @param groupId ID of the group.
         * @param version the version
         * @param jsonSummaryData the summary
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getRandomGroupsMatching(jsonWhere:Object, maxReturn:int, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "maxReturn": maxReturn
            };
            if (isOptionalParamValid(jsonWhere)) {
                data.where = jsonWhere;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Group, ServiceOperation.GetRandomGroupsMatching, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}