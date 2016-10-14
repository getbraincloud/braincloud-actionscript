package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.types.AuthenticationType;
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudIdentity extends BrainCloudService
	{		        
        public function BrainCloudIdentity(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
		 * Attach a new identity to the user
		 *
		 * Service Name - identity
		 * Service Operation - ATTACH
		 *
		 * @param externalId The users id for the new credentials
		 * @param authenticationToken The password/token
		 * @param authenticationType Type of identity
         * @param externalAuthName Optional - if attaching an external identity
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		 */
        public function attach(externalId:String, authenticationToken:String, authenticationType:AuthenticationType, externalAuthName:String = "", successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "externalId": externalId,     
                "authenticationToken": authenticationToken,   
                "authenticationType": authenticationType.name       
            };
            
            if (isOptionalParamValid(externalAuthName)) {
                data.externalAuthName = externalAuthName;
            }
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.Attach, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
		 * Removes an identity from the user
		 *
		 * Service Name - identity
		 * Service Operation - DETACH
		 *
		 * @param externalId The users ID
		 * @param authenticationToken The password/token
		 * @param confirmAnonymous If true will generate an error when downgrading to anonymous
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		 */
        public function detach(externalId:String, authenticationToken:String, confirmAnonymous:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "externalId": externalId,     
                "authenticationToken": authenticationToken,   
                "confirmAnonymous": confirmAnonymous     
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.Detach, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
         * Retrieve list of expired identities
         *
         * Service Name - identity
         * Service Operation - GET_EXPIRED_IDENTITIES
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getExpiredIdentities(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.GetExpiredIdentities, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
         * Returns a list of all child profiles in child Apps
         *
         * Service Name - identity
         * Service Operation - GET_CHILD_PROFILES
         *
         * @param includeSummaryData Whether to return the summary friend data along with this call
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getChildProfiles(includeSummaryData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeSummaryData": includeSummaryData        
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.GetChildProfiles, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
         * Retrieve list of identities
         *
         * Service Name - identity
         * Service Operation - GET_IDENTITIES
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getIdentities(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.GetIdentities, null, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
		 * Merges an existing profile with the current user
		 *
		 * Service Name - identity
		 * Service Operation - MERGE
		 *
		 * @param externalId The users id for the new credentials
		 * @param authenticationToken The password/token
		 * @param authenticationType Type of identity
         * @param externalAuthName Optional - if attaching an external identity
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		 */
        public function merge(externalId:String, authenticationToken:String, authenticationType:AuthenticationType, externalAuthName:String = "", successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "externalId": externalId,     
                "authenticationToken": authenticationToken,   
                "authenticationType": authenticationType.name       
            };
            
            if (isOptionalParamValid(externalAuthName)) {
                data.externalAuthName = externalAuthName;
            }
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.Merge, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
         * Refreshes an identity for this player
         *
         * Service Name - identity
         * Service Operation - REFRESH_IDENTITY
         *
         * @param externalId User ID
         * @param authenticationToken Password or client side token
         * @param authenticationType Type of authentication
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function refreshIdentity(externalId:String, authenticationToken:String, authenticationType:AuthenticationType, externalAuthName:String = "", successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "externalId": externalId,     
                "authenticationToken": authenticationToken,   
                "authenticationType": authenticationType.name       
            };
            
            if (isOptionalParamValid(externalAuthName)) {
                data.externalAuthName = externalAuthName;
            }
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.RefreshIdentity, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        /**
		 * Switch to a Child Profile
		 *
		 * Service Name - identity
		 * Service Operation - SWITCH_TO_CHILD_PROFILE
		 *
		 * @param childProfileId The profileId of the child profile to switch to
		 * If null and forceCreate is true a new profile will be created
		 * @param childGameId The appId of the child game to switch to
		 * @param forceCreate Should a new profile be created if it does not exist?
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		 */
        public function switchToChildProfile(childProfileId:String, childGameId:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			switchToChildProfileInternal(childProfileId, childGameId, forceCreate, false, successCallback, errorCallback, cbObject);
		}
        
        /**
		 * Switches to a child profile of an app when only one profile exists
		 * If multiple profiles exist this returns an error
		 *
		 * Service Name - identity
		 * Service Operation - SWITCH_TO_CHILD_PROFILE
		 *
		 * @param childGameId The App ID of the child game to switch to
		 * @param forceCreate Should a new profile be created if it does not exist?
		 * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
		 */
        public function switchToSingletonChildProfile(childGameId:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			switchToChildProfileInternal(null, childGameId, forceCreate, true, successCallback, errorCallback, cbObject);
		}
        
        /**
         * Switch to a Parent Profile
         *
         * Service Name - identity
         * Service Operation - SWITCH_TO_PARENT_PROFILE
         *
         * @param parentLevelName The level of the parent to switch to
         * If null and forceCreate is true a new profile will be created
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function switchToParentProfile(parentLevelName:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "levelName": parentLevelName        
            };
            
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.SwitchToParentProfile, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
        
        
        /* Private */
        
        private function switchToChildProfileInternal(childProfileId:String, childGameId:String, forceCreate:Boolean, forceSingleton:Boolean,
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "gameId": childGameId, 
                "forceCreate": forceCreate, 
                "forceSingleton": forceSingleton, 
                "releasePlatform": Client.releasePlatform.name, 
                "timeZoneOffset": Client.timeZoneOffset, 
                "languageCode": Client.languageCode,
                "countryCode": Client.countryCode         
            };
			
			if (isOptionalParamValid(childProfileId)) {
				data.profileId = childProfileId;
			}			
			
			var serverCall:ServerCall = new ServerCall(ServiceName.Identity, ServiceOperation.SwitchToChildProfile, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
        }
	}
}