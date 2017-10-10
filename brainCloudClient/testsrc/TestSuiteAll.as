package
{
import asunit.framework.TestSuite;

public class TestSuiteAll extends TestSuite
{
    public function TestSuiteAll()
    {
        super();

        addTest(new AuthenticationServiceTest("testAuthenticateEmailPassword"));
    }
}
}