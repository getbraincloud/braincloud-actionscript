package com.bitheads.braincloud.services
{
    import com.bitheads.braincloud.ServiceName;
    import com.bitheads.braincloud.ServiceOperation;
    import com.bitheads.braincloud.ServerCall;
    
    import com.bitheads.braincloud.BrainCloudClient;
    
    public class BrainCloudGamification extends BrainCloudService
    {                
        public function BrainCloudGamification(client:BrainCloudClient) 
        {
            super(client);
        }
        
        /**
         * Method will award the achievements specified.
         *
         * Service Name - Gamification
         * Service Operation - AwardAchievements
         *
         * @param achievementIds Collection of achievement ids to award
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function awardAchievements(achievementIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "achievements": achievementIds  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.AwardAchievements, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrives the list of achieved achievements.
         *
         * Service Name - Gamification
         * Service Operation - ReadAchievedAchievements
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readAchievedAchievements(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadAchievedAchievements, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Read all of the achievements defined for the game.
         *
         * Service Name - Gamification
         * Service Operation - ReadAchievements
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readAchievements(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadAchievements, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrieves all gamification data for the player.
         *
         * Service Name - Gamification
         * Service Operation - Read
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readAllGamification(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.Read, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrieves the list of completed milestones.
         *
         * Service Name - Gamification
         * Service Operation - ReadCompleteMilestones
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readCompletedMilestones(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadCompletedMilestones, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns all completed quests.
         *
         * Service Name - Gamification
         * Service Operation - ReadCompletedQuests
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readCompletedQuests(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadCompletedQuests, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrieves the list of in progress milestones
         *
         * Service Name - Gamification
         * Service Operation - ReadInProgressMilestones
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readInProgressMilestones(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadInProgressMilestones, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns quests that are in progress.
         *
         * Service Name - Gamification
         * Service Operation - ReadInProgressQuests
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readInProgressQuests(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadInProgressQuests, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrieves all milestones defined for the game.
         *
         * Service Name - Gamification
         * Service Operation - ReadMilestones
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readMilestones(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadMilestones, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method retrieves milestones of the given category.
         *
         * Service Name - Gamification
         * Service Operation - ReadMilestonesByCategory
         *
         * @param category The milestone category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readMilestonesByCategory(category:String, includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "category":category,
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadMilestonesByCategory, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns quests that have not been started.
         *
         * Service Name - Gamification
         * Service Operation - ReadNotStartedQuests
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readNotStartedQuests(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadNotStartedQuests, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method returns quests for the given category.
         *
         * Service Name - Gamification
         * Service Operation - ReadQuestsByCategory
         *
         * @param category The quest category
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readQuestsByCategory(category:String, includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "category":category,
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadQuestsByCategory, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns quests with a basic percentage.
         *
         * Service Name - Gamification
         * Service Operation - ReadQuestsWithBasicPercentage
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readQuestsWithBasicPercentage(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadQuestsWithBasicPercentage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns quests with a complex percentage.
         *
         * Service Name - Gamification
         * Service Operation - ReadQuestsWithComplexPercentage
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readQuestsWithComplexPercentage(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadQuestsWithComplexPercentage, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         *  Method returns quests with a status.
         *
         * Service Name - Gamification
         * Service Operation - ReadQuestsWithStatus
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readQuestsWithStatus(includeMetaData:Boolean, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "includeMetaData": includeMetaData  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadQuestsWithStatus, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Method returns all defined xp levels and any rewards associated
         * with those xp levels.
         *
         * Service Name - Gamification
         * Service Operation - ReadXpLevels
         *
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function readXpLevelsMetaData(successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ReadXpLevels, null, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
        
        /**
         * Resets the specified milestones' statuses to LOCKED.
         *
         * Service Name - Gamification
         * Service Operation - ResetMilestones
         *
         * @param milestoneIds Collection of milestones to reset
         * @param successCallback The success callback
         * @param errorCallback The failure callback.
         * @param cbObject The user object sent to the callback
         */
        public function resetMilestones(milestoneIds:Array, successCallback:Function = null, errorCallback:Function = null, cbObject:Object = null):void
        {
            var data:Object = {
                "milestones": milestoneIds  
            };        
            
            var serverCall:ServerCall = new ServerCall(ServiceName.Gamification, ServiceOperation.ResetMilestones, data, successCallback, errorCallback, cbObject);
            Client.sendRequest(serverCall);
        }
    }
}