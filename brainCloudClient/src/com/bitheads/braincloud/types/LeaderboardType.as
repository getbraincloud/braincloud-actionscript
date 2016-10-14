package com.bitheads.braincloud.types 
{
    public final class LeaderboardType 
    {   
        public static const HighValue:LeaderboardType = new LeaderboardType("HIGH_VALUE");
        public static const LowValue:LeaderboardType = new LeaderboardType("LOW_VALUE");
        public static const Cumulative:LeaderboardType = new LeaderboardType("CUMULATIVE");
        public static const LastValue:LeaderboardType = new LeaderboardType("LAST_VALUE");
        
        private var _value:String;
        
        public function LeaderboardType(value:String) 
        {
            _value = value;
        }  
        
        public function get value():String {
            return _value;
        }
        
        public function equals(type:LeaderboardType):Boolean {
            return _value === type.value;
        }
    }
}