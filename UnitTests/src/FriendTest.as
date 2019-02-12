package
{
    import com.bitheads.braincloud.*;

    public class FriendTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("findUserByExactUniversalId", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.friendService.findUserByExactUniversalId("randomUniversalId",
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
            }));
        }
    }
}
