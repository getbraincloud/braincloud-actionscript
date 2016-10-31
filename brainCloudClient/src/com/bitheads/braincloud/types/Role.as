package com.bitheads.braincloud.types 
{
    public final class Role 
    {   
        public static const Owner:Role = new Role("OWNER");
        public static const Admin:Role = new Role("ADMIN");
        public static const Member:Role = new Role("MEMBER");
        public static const Other:Role = new Role("OTHER");
        
        private var _value:String;
        
        public function Role(value:String) 
        {
            _value = value;
        }  
        
        public function get value():String {
            return _value;
        }
        
        public function equals(type:Role):Boolean {
            return _value === type.value;
        }
    }
}