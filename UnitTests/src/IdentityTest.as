package
{
    import com.bitheads.braincloud.*;

    public class IdentityTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("switchToChildProfile", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.identityService.switchToChildProfile(null, "20005", true,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 400)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("switchToParentProfile", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.identityService.switchToParentProfile("Master",
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 400)
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
