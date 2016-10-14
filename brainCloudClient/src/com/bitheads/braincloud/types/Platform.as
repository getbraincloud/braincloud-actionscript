package com.bitheads.braincloud.types 
{
    public class Platform 
    {    
        public static const AppleTVOS:Platform = new Platform("APPLE_TV_OS");
        public static const BlackBerry:Platform = new Platform("BB");
        public static const Facebook:Platform = new Platform("FB");
        public static const GooglePlayAndroid:Platform = new Platform("ANG");
        public static const iOS:Platform = new Platform("IOS");
        public static const Linux:Platform = new Platform("LINUX");
        public static const Mac:Platform = new Platform("MAC");
        public static const PS3:Platform = new Platform("PS3");
        public static const PS4:Platform = new Platform("PS4");
        public static const PSVita:Platform = new Platform("PS_VITA");
        public static const Roku:Platform = new Platform("ROKU");
        public static const Tizen:Platform = new Platform("TIZEN");
        public static const Unknown:Platform = new Platform("UNKNOWN");
        public static const WatchOS:Platform = new Platform("WATCH_OS");
        public static const Web:Platform = new Platform("WEB");
        public static const Wii:Platform = new Platform("WII");
        public static const WindowsPhone:Platform = new Platform("WINP");
        public static const Windows:Platform = new Platform("WINDOWS");
        public static const Xbox360:Platform = new Platform("XBOX_360");
        public static const XboxOne:Platform = new Platform("XBOX_ONE");
                
        private var _name:String;
        
        public function get name():String {
            return _name;
        }
        
        public function Platform(platformName:String) 
        {
            _name = platformName;
        }
        
        public function equals(platform:Platform):Boolean {
            return _name === platform.name;
        }
    }
}