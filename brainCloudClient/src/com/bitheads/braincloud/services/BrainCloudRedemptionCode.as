package com.bitheads.braincloud.services
{
	import com.bitheads.braincloud.ServiceName;
	import com.bitheads.braincloud.ServiceOperation;
	import com.bitheads.braincloud.ServerCall;
	
	import com.bitheads.braincloud.BrainCloudClient;
	
	public class BrainCloudRedemptionCode extends BrainCloudService
	{		        
        public function BrainCloudRedemptionCode(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Redeem a code.
         *
         * Service Name - RedemptionCode
         * Service Operation - REDEEM_CODE
         *
         * @param scanCode The code to redeem
         * @param codeType The type of code
         * @param customRedemptionInfo Optional - An object containing custom redemption data
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function redeemCode(scanCode:String, codeType:String, customRedemptionInfo:String, 
            successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = {
                "scanCode": scanCode,
                "codeType": codeType
            };
            
            if (isOptionalParamValid(customRedemptionInfo)) {
                data.customRedemptionInfo = customRedemptionInfo;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.RedemptionCode, ServiceOperation.RedeemCode, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
        
        /**
         * Retrieve the codes already redeemed by player.
         *
         * Service Name - RedemptionCode
         * Service Operation - GET_REDEEMED_CODES
         *
         * @param codeType Optional - The type of codes to retrieve. Returns all codes if left unspecified.
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function getRedeemedCodes(codeType:String, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
		{
			var data:Object = new Object();
            
            if (isOptionalParamValid(codeType)) {
                data.codeType = codeType;
            }
			
			var serverCall:ServerCall = new ServerCall(ServiceName.RedemptionCode, ServiceOperation.GetRedeemedCodes, data, successCallback, errorCallback, cbObject);
			Client.sendRequest(serverCall);
		}
	}
}