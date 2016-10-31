package com.bitheads.braincloud.types 
{
    public final class AutoJoinStrategy 
    {   
        public static const JoinFirstGroup:AutoJoinStrategy = new AutoJoinStrategy("JoinFirstGroup");
        public static const JoinRandomGroup:AutoJoinStrategy = new AutoJoinStrategy("JoinRandomGroup");
        
        private var _value:String;
        
        public function AutoJoinStrategy(value:String)
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