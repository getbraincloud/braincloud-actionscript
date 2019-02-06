package
{
    import com.bitheads.braincloud.*;

    public class FriendTest
    {
        public static function createTests(tests:Array):void
        {
<<<<<<< HEAD
            tests.push(new Test("getCurrency", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.virtualCurrencyService.getCurrency("_invalid_id_",
=======
            tests.push(new Test("findUserByExactUniversalId", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.friendService.findUserByExactUniversalId("randomUniversalId",
>>>>>>> a486b36aaf97d56f3c93e65d135ba8a84be77638
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

<<<<<<< HEAD
            tests.push(new Test("getParentCurrency", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.virtualCurrencyService.getParentCurrency("_invalid_id_", "_invalid_level_",
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
                        if (reasonCode != ReasonCodes.MISSING_PLAYER_PARENT)
                        {
                            fail("reasonCode != MISSING_PLAYER_PARENT");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("getPeerCurrency", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.virtualCurrencyService.getPeerCurrency("_invalid_id_", "_invalid_peer_code_",
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
                        if (reasonCode != ReasonCodes.PROFILE_PEER_NOT_FOUND)
                        {
                            fail("reasonCode != PROFILE_PEER_NOT_FOUND");
                            return;
                        }
                        success();
                    });
=======
            tests.push(new Test("findUsersByUniversalIdStartingWith", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.friendService.findUsersByUniversalIdStartingWith("randomUniversalId", 30,
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

            tests.push(new Test("findUsersByNameStartingWith", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.friendService.findUsersByNameStartingWith("randomName", 30,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
>>>>>>> a486b36aaf97d56f3c93e65d135ba8a84be77638
            }));
        }
    }
}
