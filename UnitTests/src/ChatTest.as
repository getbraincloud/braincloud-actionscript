package
{
    import com.bitheads.braincloud.*;

    public class ChatTest
    {
        private static var channelId:String = "";
        private static var msgId:String = "";
        private static var msgVersion:int = 0;

        public static function createTests(tests:Array):void
        {
            tests.push(new Test("Chat:getChannelId() with valid channel", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getChannelId("gl", "valid",
                    function(result:Object, cb:Object):void
                    {
                        channelId = result.data.channelId;
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));
            
            tests.push(new Test("getChannelId() with invalid channel", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getChannelId("gl", "invalid",
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
                        if (reasonCode != ReasonCodes.CHANNEL_NOT_FOUND)
                        {
                            fail("reasonCode != CHANNEL_NOT_FOUND");
                            return;
                        }
                        success();
                    });
            }));

            tests.push(new Test("Chat:getChannelInfo()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getChannelInfo(channelId,
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

            tests.push(new Test("Chat:channelConnect()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.channelConnect(channelId, 50, function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:getSubscribedChannels()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getSubscribedChannels("gl",
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        if (result.data && result.data.channels)
                        {
                            for (var i:uint = 0; i <= result.data.channels.length; i++)
                            {
                                if (result.data.channels[i].id == channelId)
                                {
                                    success();
                                    return;
                                }
                            }
                        }
                        fail("Channel not found");
                    }, fail);
            }));

            tests.push(new Test("Chat:postChatMessage()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.postChatMessage(channelId, {test:"Hello World!", rich:{"custom": 1}}, true, function(result:Object, cb:Object):void
                    {
                        msgId = result.data.msgId;
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:getChatMessage()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getChatMessage(channelId, msgId, function(result:Object, cb:Object):void
                    {
                        if (result.data.content.plain != "Hello World!")
                        {
                            fail("Expecting \"Hello World!\"");
                            return;
                        }
                        msgVersion = result.data.ver;
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:updateChatMessage()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.updateChatMessage(channelId, msgId, msgVersion, "Hello World! Edited", {"custom": 2}, function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:getChatMessage()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getChatMessage(channelId, msgId, function(result:Object, cb:Object):void
                    {
                        if (result.data.content.plain != "Hello World! Edited")
                        {
                            fail("Expecting \"Hello World!\"");
                            return;
                        }
                        if (result.data.ver != 2)
                        {
                            fail("Expecting ver == 2");
                            return;
                        }
                        msgVersion = result.data.ver;
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:getRecentMessages()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.getRecentMessages(channelId, 50, function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        if (result.data && result.data.messages)
                        {
                            for (var i:uint = 0; i <= result.data.messages.length; i++)
                            {
                                if (result.data.messages[i].msgId == msgId)
                                {
                                    success();
                                    return;
                                }
                            }
                        }
                        fail("Channel not found");
                    }, fail);
            }));

            tests.push(new Test("Chat:deleteChatMessage()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.deleteChatMessage(channelId, msgId, msgVersion, function(result:Object, cb:Object):void
                    {
                        if (result.status != 200)
                        {
                            fail("json.status != 200");
                            return;
                        }
                        success();
                    }, fail);
            }));

            tests.push(new Test("Chat:channelDisconnect()", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.chatService.channelDisconnect(channelId, function(result:Object, cb:Object):void
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
