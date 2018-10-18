package
{
    import com.bitheads.braincloud.*;

    public class IdentityTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("switchAppsTest", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.identityService.switchToChildProfile(null, "20005", true,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);

                BrainCloudClient.instance.playerStateService.readUserState(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);

                BrainCloudClient.instance.identityService.switchToParentProfile("Master",
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);

                BrainCloudClient.instance.playerStateService.readUserState(
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
