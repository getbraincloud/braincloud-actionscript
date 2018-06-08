package
{
	import com.bitheads.braincloud.*;
    import flash.utils.setTimeout;

    public class CommsTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("Comms:readServerTime()", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.timeService.readServerTime(
                    function(result:Object, cb:Object):void
                    {
                        fail("Expected faillure");
                    }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                    {
                        if (statusCode != StatusCodes.FORBIDDEN) fail("statusCode != FORBIDDEN");
                        if (reasonCode != ReasonCodes.NO_SESSION) fail("reasonCode != NO_SESSION");
                        success();
                    });
            }));

            tests.push(new Test("Comms:authenticateUniversal()", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.authenticationService.authenticateUniversal(
                    "AS3_UserA", "UserA", true,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        success();
                    }, fail);
            }));

            tests.push(new Test("Comms:readServerTime()", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.timeService.readServerTime(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        success();
                    }, fail);
            }));

            tests.push(new Test("Comms:Timeout test (With HeartBeat)", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.timeService.readServerTime(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        setTimeout(function():void
                        {
                            BrainCloudClient.instance.timeService.readServerTime(
                                function(result:Object, cb:Object):void
                                {
                                    if (result.status != 200) fail("result.status != 200");
                                    success();
                                }, fail);
                        }, 62 * 1000);
                    }, fail);
            }));

            tests.push(new Test("Comms:Timeout test (Without HeartBeat)", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.timeService.readServerTime(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        BrainCloudClient.instance.setHeartbeat(120 * 1000);
                        setTimeout(function():void
                        {
                            BrainCloudClient.instance.timeService.readServerTime(
                                function(result:Object, cb:Object):void
                                {
                                    BrainCloudClient.instance.setHeartbeat(0);
                                    fail("Expected faillure");
                                }, function(statusCode:int, reasonCode:int, result:Object, cb:Object):void
                                {
                                    BrainCloudClient.instance.setHeartbeat(0);
                                    if (statusCode != StatusCodes.FORBIDDEN) fail("statusCode != FORBIDDEN");
                                    if (reasonCode != ReasonCodes.PLAYER_SESSION_EXPIRED) fail("reasonCode != PLAYER_SESSION_EXPIRED");
                                    success();
                                });
                        }, 62 * 1000);
                    }, fail);
            }));

            tests.push(new Test("Comms:authenticateUniversal()", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.authenticationService.authenticateUniversal(
                    "AS3_UserA", "UserA", true,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        success();
                    }, fail);
            }));

            // Retry here TODO
            // tests.push(new Test("Comms:retry 30sec script", null, null, function(success:Function, fail:Function):void
            // {
            //     BrainCloudClient.instance.scriptService.runScript(
            //         "TestTimeoutRetry", {},
            //         function(result:Object, cb:Object):void
            //         {
            //             if (result.status != 200) fail("result.status != 200");
            //             success();
            //         }, fail);
            // }));
            
            // Do a normal call after this to make sure things are still up and running nicely
            tests.push(new Test("Comms:readServerTime()", null, null, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.timeService.readServerTime(
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("result.status != 200");
                        success();
                    }, fail);
            }));
            
            // Logout
            tests.push(new Test("Comms:tearDown", null, null, function(success:Function, fail:Function):void
            {
                var onLoggedOut:Function = function():void
                {
                    BrainCloudClient.instance.resetCommunications();
                    success();
                };

                BrainCloudClient.instance.playerStateService.logout(onLoggedOut, onLoggedOut);
            }));
        }
    }
}
