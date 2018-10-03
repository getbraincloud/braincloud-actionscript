package
{
    import com.bitheads.braincloud.*;

    public class AppStoreTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("verifyPurchase", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.verifyPurchase("_invalid_store_id_", {},
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_STORE_ID)
                        {
                            fail("reasonCode != INVALID_STORE_ID");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("getEligiblePromotions", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.getEligiblePromotions(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));
            
            tests.push(new Test("getSalesInventory", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.getSalesInventory("_invalid_store_id_", "_invalid_user_currency_",
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_STORE_ID)
                        {
                            fail("reasonCode != INVALID_STORE_ID");
                            return;
                        }
                        success();
                    });
            }));
            
            tests.push(new Test("getSalesInventoryByCategory", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.getSalesInventoryByCategory("_invalid_store_id_", "_invalid_user_currency_", "_invalid_category_",
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_STORE_ID)
                        {
                            fail("reasonCode != INVALID_STORE_ID");
                            return;
                        }
                        success();
                    });
            }));
            
            tests.push(new Test("startPurchase", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.startPurchase("_invalid_store_id_", {},
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_STORE_ID)
                        {
                            fail("reasonCode != INVALID_STORE_ID");
                            return;
                        }
                        success();
                    });
            }));
            
            tests.push(new Test("finalizePurchase", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.finalizePurchase("_invalid_store_id_", "_invalid_transaction_id_", {},
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_STORE_ID)
                        {
                            fail("reasonCode != INVALID_STORE_ID");
                            return;
                        }
                        success();
                    });
            }));
        }
    }
}
