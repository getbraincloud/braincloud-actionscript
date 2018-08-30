package
{
    import com.bitheads.braincloud.*;

    public class DivisionTest
    {

        public static function createTests(tests:Array):void
        {
            tests.push(new Test("GetDivisionInfo", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.tournamentService.getDivisionInfo("Invalid_Id",
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
                        if (reasonCode != ReasonCodes.DIVISION_SET_DOESNOT_EXIST)
                        {
                            fail("reasonCode != DIVISION_SET_DOESNOT_EXIST");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("GetMyDivisions", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.tournamentService.getMyDivisions(
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

            tests.push(new Test("JoinDivision", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.tournamentService.joinDivision("Invalid_Id", "", 0,
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
                        if (reasonCode != ReasonCodes.DIVISION_SET_DOESNOT_EXIST)
                        {
                            fail("reasonCode != DIVISION_SET_DOESNOT_EXIST");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("LeaveDivisionInstance", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.tournamentService.leaveDivisionInstance("Invalid_Id",
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
                        if (reasonCode != ReasonCodes.LEADERBOARD_NOT_DIVISION_SET_INSTANCE)
                        {
                            fail("reasonCode != LEADERBOARD_NOT_DIVISION_SET_INSTANCE");
                            return;
                        }
                        success();
                    });
            }));
        }
    }
}
