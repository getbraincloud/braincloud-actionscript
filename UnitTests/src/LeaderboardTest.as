package
{
    import com.bitheads.braincloud.*;

    public class LeaderboardTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("getSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.leaderboardService.getSocialLeaderboardByVersion("testSocialLeaderboard", true, 0,
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
            
            tests.push(new Test("getGroupSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {

                BrainCloudClient.instance.leaderboardService.getGroupSocialLeaderboardByVersion("testSocialLeaderboard", "_invalid_group_id_", 0,
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
                        if (reasonCode != ReasonCodes.MISSING_RECORD)
                        {
                            fail("reasonCode != MISSING_RECORD");
                            return;
                        }
                        success();
                    });


            }));
            
            tests.push(new Test("getPlayersSocialLeaderboardByVersion", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var testPlayers:Array = new Array("testPlayer1", "testPlayer2");

                BrainCloudClient.instance.leaderboardService.getPlayersSocialLeaderboardByVersion("testSocialLeaderboard", testPlayers, 0,
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
        }
    }
}
