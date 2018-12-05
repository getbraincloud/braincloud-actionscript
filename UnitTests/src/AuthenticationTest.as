package
{
    import com.bitheads.braincloud.*;

    public class AuthenticationTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("AuthenticateHandoff", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.authenticationService.authenticateHandoff("invalid_handoffId", "invalid_securityToken",
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected failure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.FORBIDDEN)
                        {
                            fail("statusCode != FORBIDDEN");
                            return;
                        }
                        if (reasonCode != ReasonCodes.TOKEN_DOES_NOT_MATCH_USER)
                        {
                            fail("reasonCode != TOKEN_DOES_NOT_MATCH_USER");
                            return;
                        }
                        success();
                    });
            }));
        }
    }
}
