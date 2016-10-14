package com.bitheads.braincloud.types 
{
    public class ACL 
    {        
        public static const ACCESS_NONE:uint = 0;
        public static const ACCESS_READ:uint = 1;
        public static const ACCESS_READ_WRITE:uint = 2;
        
        public var other:uint;
        
        public function ACL(other:uint) 
        {
            other = other;
        }
        
        public function toObject():Object
        {
            var obj:Object = {
                "other": other
            };
            return obj;
        }
    }
}