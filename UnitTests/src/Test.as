package
{
    import com.bitheads.braincloud.BrainCloudClient;

    public class Test
    {
        private var m_name:String;
        private var m_units:Array = new Array();

        public var m_beforeFn:Function = null;
        public var m_afterFn:Function = null;
        public var m_runFn:Function = null;

        public function Test(name:String, beforeFn:Function, afterFn:Function, runFn:Function)
        {
            m_name = name;
            m_beforeFn = beforeFn;
            m_afterFn = afterFn;
            m_runFn = runFn;
        }

        public function getName():String
        {
            return m_name;
        }

        public function before(success:Function, fail:Function):void
        {
            if (m_beforeFn)
            {
                m_beforeFn(success, fail);
                return;
            }
            success();
        }

        public function after(resolve:Function):void
        {
            if (m_afterFn)
            {
                m_afterFn(resolve);
                return;
            }
            resolve();
        }

        public function run(success:Function, fail:Function):void
        {
            if (m_runFn)
            {
                m_runFn(success, fail);
                return;
            }
            trace("Missing tests for: " + m_name);
            fail();
        }

        public static function setUpWithAuthenticate(success:Function, fail:Function):void
        {
            BrainCloudClient.instance.authenticationService.authenticateEmailPassword("AS3_UserA", "UserA", true, success, fail, null);
        }

        public static function tearDownLogout(resolve:Function):void
        {
            if (BrainCloudClient.instance.isAuthenticated)
            {
                var onLoggedOut:Function = function():void
                {
                    BrainCloudClient.instance.resetCommunications();
                    resolve();
                };

                BrainCloudClient.instance.playerStateService.logout(onLoggedOut, onLoggedOut);
            }
            else
            {
                resolve();
            }
        }
    }
}
