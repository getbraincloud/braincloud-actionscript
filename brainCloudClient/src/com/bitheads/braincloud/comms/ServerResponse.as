package com.bitheads.braincloud.comms
{
    import com.bitheads.braincloud.ServerCall;
    
    internal class ServerResponse
    {
        public function get serverCall():ServerCall
        {
            return _serverCall;
        }
        
        public function get response():Object
        {
            return _response;
        }
        
        private var _serverCall:ServerCall;
        private var _response:Object;
        
        public function ServerResponse(serverCall:ServerCall, response:Object)
        {
            _serverCall = serverCall;
            _response = response;
        }
    }
}