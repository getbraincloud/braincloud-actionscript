package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    import com.bitheads.braincloud.types.AuthenticationType;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudAuthentication extends BrainCloudService
    {        
        private var _profileId:String;
        private var _anonymousId:String;
        
        public function BrainCloudAuthentication(client:BrainCloudClient)
        {
            super(client);
        }
        
        public function get anonymousId():String
        {
            return _anonymousId;
        }
        
        public function set anonymousId(anonymousId:String):void
        {
            _anonymousId = anonymousId;
        }
        
        public function get profileId():String
        {
            return _profileId;
        }
        
        public function set profileId(profileId:String):void
        {
            _profileId = profileId;
        }
        
        /**
         * Used to clear the saved profile id - to use in cases when the user is
         * attempting to switch to a different game profile.
         */
        public function clearSavedProfileId():void
        {
            _profileId = "";
        }
        
        /**
        * Used to create the anonymous installation id for the brainCloud profile.
        * @return A unique Anonymous ID
        */
        public function generateAnonymousId():String
        {
            return createUUID();
        }
        
        /**
         * Initialize - initializes the identity service with a saved
         * anonymous installation id and most recently used profile id
         *
         * @param anonymousId  The anonymous installation id that was generated for this device
         * @param profileId The id of the profile id that was most recently used by the app (on this device)
         */
        public function initialize(profileId:String, anonymousId:String):void
        {
            _profileId = profileId;
            _anonymousId = anonymousId;
        }
        
        /**
         * Authenticate a user anonymously with brainCloud - used for apps that don't want to bother
         * the user to login, or for users who are sensitive to their privacy
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param forceCreate  Should a new profile be created if it does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateAnonymous(forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(_anonymousId, "", AuthenticationType.Anonymous, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user with brainCloud using their Facebook Credentials
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param fbUserId The facebook id of the user
         * @param fbAuthToken The validated token from the Facebook SDK
         *   (that will be further validated when sent to the bC service)
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateFacebook(fbUserId:String, fbAuthToken:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(fbUserId, fbAuthToken, AuthenticationType.Facebook, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using their Game Center id
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param gameCenterId The player's game center id  (use the playerID property from the local GKPlayer object)
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateGameCenter(gameCenterId:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(gameCenterId, "", AuthenticationType.GameCenter, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user with a custom Email and Password.  Note that the client app
         * is responsible for collecting (and storing) the e-mail and potentially password
         * (for convenience) in the client data.  For the greatest security,
         * force the user to re-enter their * password at each login.
         * (Or at least give them that option).
         *
         * Note that the password sent from the client to the server is protected via SSL.
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param email  The e-mail address of the user
         * @param password  The password of the user
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateEmailPassword(email:String, password:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(email, password, AuthenticationType.Email, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a userid and password (without any validation on the userid).
         * Similar to AuthenticateEmailPassword - except that that method has additional features to
         * allow for e-mail validation, password resets, etc.
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param userId  The userId of the user
         * @param password  The password of the user
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateUniversal(userId:String, password:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, password, AuthenticationType.Universal, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a steam userid and session ticket (without any validation on the userid).
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param userId  String representation of 64 bit steam id
         * @param sessionticket  The session ticket of the user (hex encoded)
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateSteam(userId:String, sessionticket:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, sessionticket, AuthenticationType.Steam, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a google userid(email address) and google authentication token.
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param userId  String representation of google+ userid (email)
         * @param token  The authentication token derived via the google apis.
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateGoogle(userId:String, token:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, token, AuthenticationType.Google, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a Twitter userid, authentication token, and secret from Twitter.
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param userId  String representation of Twitter userid
         * @param token  The authentication token derived via the Twitter apis.
         * @param secret  The secret given when attempting to link with Twitter
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateTwitter(userId:String, token:String, secret:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, token + ":" + secret, AuthenticationType.Twitter, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a Pase userid and authentication token
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param userId String representation of Parse userid
         * @param token The authentication token
         * @param forceCreate Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateParse(userId:String, token:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, token, AuthenticationType.Parse, null, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /*
         * Authenticate the user using a handoffId and authentication token
         *
         * Service Name - Authenticate
         * Service Operation - Authenticate
         *
         * @param handoffId braincloud handoff id generated from cloud script
         * @param securityToken The authentication token
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateHandoff(handoffId:String, securityToken:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(handoffId, securityToken, AuthenticationType.Handoff, null, false, successCallback, errorCallback, cbObject);
        }

        /**
         * Authenticate the user via cloud code (which in turn validates the supplied credentials against an external system).
         * This allows the developer to extend brainCloud authentication to support other backend authentication systems.
         *
         * Service Name - Authenticate
         * Server Operation - Authenticate
         *
         * @param userId The user id
         * @param token The user token (password etc)
         * @param externalAuthName The name of the cloud script to call for external authentication
         * @param force Should a new profile be created for this user if the account does not exist?
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function authenticateExternal(userId:String, token:String, externalAuthName:String, forceCreate:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            authenticate(userId, token, AuthenticationType.External, externalAuthName, forceCreate, successCallback, errorCallback, cbObject);
        }
        
        /**
         * Reset Email password - Sends a password reset email to the specified address
         *
         * Service Name - Authenticate
         * Operation - ResetEmailPassword
         *
         * @param externalId The email address to send the reset email to.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         * Note the follow error reason codes:
         *
         * SECURITY_ERROR (40209) - If the email address cannot be found.
         */
        public function resetEmailPassword(externalId:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "externalId": externalId,
                "gameId": Client.appId                 
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Authenticate, ServiceOperation.ResetEmailPassword, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        private function authenticate(
            externalId:String, 
            authenticationToken:String, 
            authenticationType:AuthenticationType, 
            externalAuthName:String, 
            forceCreate:Boolean, 
            successCallback:Function, 
            errorCallback:Function, 
            cbObject:Object):void
        {
            var data:Object = {
                "gameId": Client.appId, 
                "externalId": externalId, 
                "releasePlatform": Client.releasePlatform.name, 
                "gameVersion": Client.appVersion, 
                "clientLibVersion": Client.clientLibVersion, 
                "authenticationToken": authenticationToken, 
                "authenticationType": authenticationType.name, 
                "forceCreate": forceCreate, 
                "anonymousId": _anonymousId, 
                "profileId": _profileId, 
                "timeZoneOffset": Client.timeZoneOffset, 
                "languageCode": Client.languageCode,
                "countryCode": Client.countryCode,
                "clientLib": "as3"                 
            };
            
            if (externalAuthName)
            {
                data.externalAuthName = externalAuthName;
            }            
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Authenticate, ServiceOperation.Authenticate, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        private function createUUID():String {     
            var uid:Array = new Array();
            var chars:Array = new Array( 48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70 );
            var separator:uint = 45;
            var template:Array = new Array( 8,4,4,4,12 );
             
            for ( var a:uint = 0; a < template.length; a++ ) {
                for ( var b:uint = 0; b < template[a]; b++ ) {
                    uid.push( chars[ Math.floor( Math.random() *  chars. length ) ] );
                } if ( a < template.length - 1 ) {
                    uid.push( separator ); 
                }
            }
             
            return String.fromCharCode.apply( null, uid );
        }
    }
}