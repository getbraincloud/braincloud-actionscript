package com.bitheads.braincloud.types 
{
    public final class RotationType 
    {   
        public static const Never:RotationType = new RotationType("NEVER");
        public static const Daily:RotationType = new RotationType("DAILY");
        public static const Weekly:RotationType = new RotationType("WEEKLY");
        public static const Monthly:RotationType = new RotationType("MONTHLY");
        public static const Yearly:RotationType = new RotationType("YEARLY");
        
        private var _value:String;
        
        public function RotationType(value:String) 
        {
            _value = value;
        }  
        
        public function get value():String {
            return _value;
        }
        
        public function equals(type:RotationType):Boolean {
            return _value === type.value;
        }
    }
}