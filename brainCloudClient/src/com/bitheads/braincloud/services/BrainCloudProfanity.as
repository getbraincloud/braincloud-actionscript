package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudProfanity extends BrainCloudService
    {                
        public function BrainCloudProfanity(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Checks supplied text for profanity.
         *
         * Service Name - Profanity
         * Service Operation - ProfanityCheck
         *
         * @param text The text to check
         * @param languages Optional comma delimited list of two character language codes
         * @param flagEmail Optional processing of email addresses
         * @param flagPhone Optional processing of phone numbers
         * @param flagUrls Optional processing of urls
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         * Significant error codes:
         *
         * 40421 - WebPurify not configured
         * 40422 - General exception occurred
         * 40423 - WebPurify returned an error (Http status != 200)
         * 40424 - WebPurify not enabled
         */
        public function profanityCheck(text:String, languages:String, flagEmail:Boolean, flagPhone:Boolean, flagUrls:Boolean, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "text": text,
                "flagEmail": flagEmail,
                "flagPhone": flagPhone,
                "flagUrls": flagUrls
            };
            
            if (isOptionalParamValid(languages)) {
                data.languages = languages;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Profanity, ServiceOperation.ProfanityCheck, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Replaces the characters of profanity text with a passed character(s).
         *
         * Service Name - Profanity
         * Service Operation - ProfanityReplaceText
         *
         * @param text The text to check
         * @param replaceSymbol The text to replace individual characters of profanity text with
         * @param languages Optional comma delimited list of two character language codes
         * @param flagEmail Optional processing of email addresses
         * @param flagPhone Optional processing of phone numbers
         * @param flagUrls Optional processing of urls
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         * Significant error codes:
         *
         * 40421 - WebPurify not configured
         * 40422 - General exception occurred
         * 40423 - WebPurify returned an error (Http status != 200)
         * 40424 - WebPurify not enabled
         */
        public function profanityReplaceText(text:String, replaceSymbol:String, languages:String, flagEmail:Boolean, flagPhone:Boolean, flagUrls:Boolean, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "text": text,
                "replaceSymbol": replaceSymbol,
                "flagEmail": flagEmail,
                "flagPhone": flagPhone,
                "flagUrls": flagUrls
            };
            
            if (isOptionalParamValid(languages)) {
                data.languages = languages;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Profanity, ServiceOperation.ProfanityReplaceText, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Checks supplied text for profanity and returns a list of bad wors.
         *
         * Service Name - Profanity
         * Service Operation - ProfanityIdentifyBadWords
         *
         * @param text The text to check
         * @param languages Optional comma delimited list of two character language codes
         * @param flagEmail Optional processing of email addresses
         * @param flagPhone Optional processing of phone numbers
         * @param flagUrls Optional processing of urls
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         *
         * Significant error codes:
         *
         * 40421 - WebPurify not configured
         * 40422 - General exception occurred
         * 40423 - WebPurify returned an error (Http status != 200)
         * 40424 - WebPurify not enabled
         */
        public function profanityIdentifyBadWords(text:String, languages:String, flagEmail:Boolean, flagPhone:Boolean, flagUrls:Boolean, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "text": text,
                "flagEmail": flagEmail,
                "flagPhone": flagPhone,
                "flagUrls": flagUrls
            };
            
            if (isOptionalParamValid(languages)) {
                data.languages = languages;
            }
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Profanity, ServiceOperation.ProfanityIdenitfyBadWords, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}