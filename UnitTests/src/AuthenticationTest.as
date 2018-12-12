package
{
    import com.bitheads.braincloud.*;
    import flash.utils.Dictionary;

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

            tests.push(new Test("ResetEmailPasswordAdvanced", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var testMap:Object = new Object(); 
                testMap["fromAddress"] = "fromAddress";
                testMap["fromName"] = "fromName";
                testMap["replyName"] = "replyName"; 
                testMap["templateId"] = "8f14c77d-61f4-4966-ab6d-0bee8b13d090";
                testMap["subject"] = "subject"; 
                testMap["body"] = "body here"; 
                var substitutions:Object = new Object(); 
                substitutions[":name"] = "John Doe"; 
                substitutions[":resetLink"] = "www.dummyLink.io"; 
                testMap["substitutions"] = substitutions; 
                var categories:Object = new Object(); 
                categories[0] = "category1"; 
                categories[1] = "category2"; 
                testMap["categories"] = categories; 
                
                BrainCloudClient.instance.authenticationService.resetEmailPasswordAdvanced("braincloudunittest@gmail.com", testMap,
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected faillure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.BAD_REQUEST)
                        {
                            fail("statusCode != BAD_REQUEST");
                            return;
                        }
                        if (reasonCode != ReasonCodes.INVALID_FROM_ADDRESS)
                        {
                            fail("reasonCode != INVALID_FROM_ADDRESS");
                            return;
                        }
                        success();
                    });
            }));
        }
    }
}
