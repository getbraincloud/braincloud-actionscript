package com.bitheads.braincloud.services 
{
    import com.bitheads.braincloud.BrainCloudClient;
    public class BrainCloudService 
    {
        protected var Client:BrainCloudClient;
        
        public function BrainCloudService(client:BrainCloudClient) 
        {
            Client = client;
        }
        
        protected function isOptionalParamValid(param:Object):Boolean {
            if (param !== null) {   
                if (param is String) {
                    return (param as String).length > 0;
                }
                return true;
            }
            return false;
        }
    }
}