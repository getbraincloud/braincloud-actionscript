package com.bitheads.braincloud.types
{    
    public class AuthenticationType
    {
        public static const Anonymous:AuthenticationType = new AuthenticationType("Anonymous");
        public static const Universal:AuthenticationType = new AuthenticationType("Universal");
        public static const Email:AuthenticationType = new AuthenticationType("Email");
        public static const Facebook:AuthenticationType = new AuthenticationType("Facebook");
        public static const GameCenter:AuthenticationType = new AuthenticationType("GameCenter");
        public static const Steam:AuthenticationType = new AuthenticationType("Steam");
        public static const Google:AuthenticationType = new AuthenticationType("Google");
        public static const Twitter:AuthenticationType = new AuthenticationType("Twitter");
        public static const Parse:AuthenticationType = new AuthenticationType("Parse");
        public static const Handoff:AuthenticationType = new AuthenticationType("Handoff");
        public static const SettopHandoff:AuthenticationType = new AuthenticationType("SettopHandoff");
        public static const External:AuthenticationType = new AuthenticationType("External");
        public static const Unknown:AuthenticationType = new AuthenticationType("Unknown");
        
        private var _name:String;
        
        public function get name():String {
            return _name;
        }
        
        public function AuthenticationType(authTypeName:String) 
        {
            _name = authTypeName;
        }
        
        public function equals(authType:AuthenticationType):Boolean {
            return _name === authType.name;
        }
    }
}