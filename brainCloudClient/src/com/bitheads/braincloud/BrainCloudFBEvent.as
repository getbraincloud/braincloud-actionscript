package com.bitheads.braincloud 
{
    import flash.events.Event;
    /**
     * ...
     * @author Franco
     */
    public class BrainCloudFBEvent extends Event
    {
        public static const FACEBOOK_SUCCESS:String = "fb_connected";
        public static const FACEBOOK_FAIL:String = "fb_login_failed";
        
        public static const FB_ERROR_INIT:String = "fb_init_error";
        public static const FB_ERROR_LOGIN:String = "fb_login_error";
        public static const FB_ERROR_AUTH:String = "fb_not_authorized";
        public static const FB_ERROR_TIMEOUT:String = "fb_timeout";
        
        public var errorType:String;
        
        public function BrainCloudFBEvent( in_eventType:String, in_errorType:String = null) 
        {
            super( in_eventType, false, false);
            errorType = in_errorType;
        }
        
    }

}