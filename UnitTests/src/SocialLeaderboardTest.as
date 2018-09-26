package
{
    import com.bitheads.braincloud.*;

    public class SocialLeaderboardTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("getSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.getSocialLeaderboardByVersion("_invalid_group_id_", true, 0
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
                        if (reasonCode != ReasonCodes.INVALID_GROUP_ID)
                        {
                            fail("reasonCode != INVALID_GROUP_ID");
                            return;
                        }
                        success();
                    });
            }));
            
            tests.push(new Test("getGroupSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.appStoreService.getGroupSocialLeaderboardByVersion("_invalid_leaderboard_id_", "_invalid_group_id_", 0
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
                        if (reasonCode != ReasonCodes.INVALID_GROUP_ID)
                        {
                            fail("reasonCode != INVALID_GROUP_ID");
                            return;
                        }
                        success();
                    });
            }));
            
            tests.push(new Test("getPlayerSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var testPlayers:Array = new Array("testPlayer1", "testPlayer2");

                BrainCloudClient.instance.appStoreService.getPlayerSocialLeaderboardByVersion("_invalid_group_id_", testPlayers, 0,
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
                        if (reasonCode != ReasonCodes.INVALID_GROUP_ID)
                        {
                            fail("reasonCode != INVALID_GROUP_ID");
                            return;
                        }
                        success();
                    });
            }));
        }
    }
}
