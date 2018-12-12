package
{
    import com.bitheads.braincloud.*;

    public class MessagingTest
    {
        public static function createTests(tests:Array):void
        {
            tests.push(new Test("deleteMessages", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var arr:Array = new Array ("");
                BrainCloudClient.instance.messagingService.deleteMessages("inbox", arr,
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

            tests.push(new Test("getMessageBoxes", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.messagingService.getMessageBoxes(
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

            tests.push(new Test("getMessageCounts", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.messagingService.getMessageCounts(
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

            tests.push(new Test("getMessages", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var arr:Array = new Array("");
                BrainCloudClient.instance.messagingService.getMessages("inbox", arr,
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
                        if (reasonCode != ReasonCodes.MESSAGE_NOT_FOUND)
                        {
                            fail("reasonCode != MESSAGE_NOT_FOUND");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("getMessagesPage", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                //expecting null incoming data because bad profile id
                var context:String = "{\"context\": \"Invalid\"}";

                BrainCloudClient.instance.messagingService.getMessagesPage(context,
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
            
            tests.push(new Test("getMessagesPageOffset", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.messagingService.getMessagesPageOffset("invalidContext", 1,
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
                        if (reasonCode != ReasonCodes.DECODE_CONTEXT)
                        {
                            fail("reasonCode != DECODE_CONTEXT");
                            return;
                        }
                        success();
                    });
            }));

            
            tests.push(new Test("sendMessage", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                //expect null incoming data because profile message being sent to doesn't exist
                var contentJson:String = "{\"subject\": \"Chat and messaging features are here!\", \"text\": \"hi.\"}";
                var badProfileId:Array = new Array("badProfile");
                BrainCloudClient.instance.messagingService.sendMessage(badProfileId, contentJson,
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

            tests.push(new Test("sendMessageSimple", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var contentJson:String = "{\"subject\": \"Chat and messaging features are here!\", \"text\": \"hi.\"}";
                var badProfileId:Array = new Array("badProfile");
                BrainCloudClient.instance.messagingService.sendMessageSimple(badProfileId, contentJson,
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

            tests.push(new Test("markMessagesRead", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                var id:String = "id";
                var msgId:Array = new Array(id);

                BrainCloudClient.instance.messagingService.markMessagesRead("inbox", msgId, true,
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
