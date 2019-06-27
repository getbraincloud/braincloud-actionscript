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

            tests.push(new Test("Group:createGroupWithSummaryData", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.createGroupWithSummaryData(
                    "test",
                    "test",
                    false,
                    null,
                    null,
                    { test : "asdf"},
                    null,
                    { test : "summary"},
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

            tests.push(new Test("Group:setGroupOpen", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.setGroupOpen(
                    groupId,
                    true,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("json.status != 200");
                        success();
                    }, fail);
            }));

            tests.push(new Test("Group:UpdateGroupSummaryData", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.updateGroupSummaryData(
                    groupId,
                    -1,
                    { test : "summary"},
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("json.status != 200");
                        success();
                    }, fail);
            }));
            
            tests.push(new Test("Group:GetRandomGroupsMatching", Test.setUpWithAuthenticate, Test.tearDownLogout, function(success:Function, fail:Function):void
            {
                BrainCloudClient.instance.groupService.getRandomGroupsMatching(
                    { groupType : "BLUE"},
                    2,
                    function(result:Object, cb:Object):void
                    {
                        if (result.status != 200) fail("json.status != 200");
                        success();
                    }, fail);
            }));
        }
    }
}
