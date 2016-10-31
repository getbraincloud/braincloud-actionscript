package com.bitheads.braincloud.types 
{
    public class GroupACL 
    {        
        public static const ACCESS_NONE:uint = 0;
        public static const ACCESS_READ:uint = 1;
        public static const ACCESS_READ_WRITE:uint = 2;
        
        public var other:uint;
        public var member:uint;
        
        public function GroupACL(other:uint, member:uint)
        {
            other = other;
            member = member;
        }
        
        public function toObject():Object
        {
            var obj:Object = {
                "other": other,
                "member": member
            };
            return obj;
        }
    }
}