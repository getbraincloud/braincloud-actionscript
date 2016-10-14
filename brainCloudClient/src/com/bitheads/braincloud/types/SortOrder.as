package com.bitheads.braincloud.types 
{
    public final class SortOrder 
    {   
        public static const HighToLow:SortOrder = new SortOrder("HIGH_TO_LOW");
        public static const LowToHigh:SortOrder = new SortOrder("LOW_TO_HIGH");
        
        private var _value:String;
        
        public function SortOrder(value:String) 
        {
            _value = value;
        }  
        
        public function get value():String {
            return _value;
        }
        
        public function equals(order:SortOrder):Boolean {
            return _value === order.value;
        }
    }
}