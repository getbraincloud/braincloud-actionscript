package com.bitheads.braincloud.types 
{
    import com.bitheads.braincloud.types.Platform;
    public class FriendPlatform 
    {    
        public static const All:FriendPlatform = new FriendPlatform("All");
        public static const BrainCloud:FriendPlatform = new FriendPlatform("brainCloud");
        public static const Facebook:FriendPlatform = new FriendPlatform("Facebook");
        public static const Unknown:FriendPlatform = new FriendPlatform("UNKNOWN");
                
        private var _name:String;
        
        public function get name():String {
            return _name;
        }
        
        public function FriendPlatform(platformName:String) 
        {
            _name = platformName;
        }
        
        public function equals(platform:FriendPlatform):Boolean {
            return _name === platform.name;
        }
    }
}