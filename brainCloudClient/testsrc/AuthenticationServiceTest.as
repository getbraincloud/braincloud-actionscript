package
{
import asunit.framework.TestCase;

import com.bitheads.braincloud.BrainCloudClient;

public class AuthenticationServiceTest extends TestCase
{


    public function AuthenticationServiceTest(testMethod:String)
    {
        super(testMethod);
    }


    public function testAuthenticateEmailPassword() : void
    {
        var testResult:UnitTestResult = new UnitTestResult();

        BrainCloudClient.instance.authenticationService.authenticateEmailPassword("qwzxce", "qzxcwe", true, testResult.ApiSuccess, testResult.ApiError, null);

        testResult.Run(function() {

        });
    }
}
}