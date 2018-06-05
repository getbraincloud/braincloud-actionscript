package
{
    import com.bitheads.braincloud.BrainCloudClient;

    public class GroupTest
    {
        private static var groupId:String = "";

        public static function createTests(tests:Array):void
        {
            tests.push(new Test("Group:createGroup", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.createGroup(
                    "test",
                    "test",
                    false,
                    null,
                    null,
                    { test : "asdf"},
                    null,
                    function(result:Object, cb:Object):void
                    {
                        groupId = result.data.groupId;
                        if (result.status != 200) fail("json.status != 200");
                        success();
                    }, fail);
            }));

            tests.push(new Test("Group:readGroupData", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.readGroupData(
                    groupId,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("json.status != 200");
                        success();
                    }, fail);
            }));
        }
    }
}
