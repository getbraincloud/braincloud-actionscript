package com.bitheads.braincloud 
{
	public class ServiceOperation 
	{
		public static const None:String = "NONE";

        public static const Authenticate:String = "AUTHENTICATE";
        public static const Attach:String = "ATTACH";
        public static const Merge:String = "MERGE";
        public static const Detach:String = "DETACH";
        public static const ResetEmailPassword:String = "RESET_EMAIL_PASSWORD";
        public static const SwitchToChildProfile:String = "SWITCH_TO_CHILD_PROFILE";
        public static const SwitchToParentProfile:String = "SWITCH_TO_PARENT_PROFILE";
        public static const GetChildProfiles:String = "GET_CHILD_PROFILES";
        public static const GetIdentities:String = "GET_IDENTITIES";
        public static const GetExpiredIdentities:String = "GET_EXPIRED_IDENTITIES";
        public static const RefreshIdentity:String = "REFRESH_IDENTITY";
        public static const AttachParentWithIdentity:String = "ATTACH_PARENT_WITH_IDENTITY";
        public static const AttachPeerProfile:String = "ATTACH_PEER_PROFILE";
        public static const DetachPeer:String = "DETACH_PEER";
        public static const GetPeerProfiles:String = "GET_PEER_PROFILES";
        public static const DetachParent:String = "DETACH_PARENT";
        
        public static const Create:String = "CREATE";
        public static const CreateWithIndexedId:String = "CREATE_WITH_INDEXED_ID";
        public static const Reset:String = "RESET";
        public static const Read:String = "READ";
        public static const ReadSingleton:String = "READ_SINGLETON";
        public static const ReadByType:String = "READ_BY_TYPE";
        public static const Verify:String = "VERIFY";
        public static const ReadShared:String = "READ_SHARED";
        public static const ReadSharedEntity:String = "READ_SHARED_ENTITY";
        
        // push notification
        public static const Deregister:String = "DEREGISTER";
        public static const DeregisterAll:String = "DEREGISTER_ALL";
        public static const Register:String = "REGISTER";
        public static const SendSimple:String = "SEND_SIMPLE";
        public static const SendRich:String = "SEND_RICH";
        public static const SendTemplatedToGroup:String = "SEND_TEMPLATED_TO_GROUP";
        public static const SendNormalizedToGroup:String = "SEND_NORMALIZED_TO_GROUP";
        public static const SendNormalized:String = "SEND_NORMALIZED";
        public static const SendNormalizedBatch:String = "SEND_NORMALIZED_BATCH";
        
        public static const Trigger:String = "TRIGGER";
        public static const TriggerMultiple:String = "TRIGGER_MULTIPLE";
        public static const TriggerGrantExperience:String = "TRIGGER_GRANT_EXPERIENCE";
        
        public static const FullReset:String = "FULL_PLAYER_RESET";
        public static const DataReset:String = "GAME_DATA_RESET";
        
        public static const Update:String = "UPDATE";
        public static const UpdatePartial:String = "UPDATE_PARTIAL";
        public static const UpdateShared:String = "UPDATE_SHARED";
        public static const UpdateSingleton:String = "UPDATE_SINGLETON";
        public static const UpdateAcl:String = "UPDATE_ACL";
        public static const UpdateTimeToLive:String = "UPDATE_TIME_TO_LIVE";
        public static const Delete:String = "DELETE";
        public static const DeleteSingleton:String = "DELETE_SINGLETON";
        public static const UpdateSummary:String = "UPDATE_SUMMARY";
        public static const UpdateSetMinimum:String = "UPDATE_SET_MINIMUM";
        public static const UpdateIncrementToMaximum:String = "UPDATE_INCREMENT_TO_MAXIMUM";
        public static const ProcessStatistics:String = "PROCESS_STATISTICS";
        
        public static const GetFriendProfileInfoForExternalId:String = "GET_FRIEND_PROFILE_INFO_FOR_EXTERNAL_ID";
        public static const GetExternalIdForProfileId:String = "GET_EXTERNAL_ID_FOR_PROFILE_ID";
        public static const ReadFriendEntity:String = "READ_FRIEND_ENTITY";
        public static const ReadFriendsEntities:String = "READ_FRIENDS_ENTITIES";
        public static const ReadFriendsWithApplication:String = "READ_FRIENDS_WITH_APPLICATION";
        public static const ReadFriends:String = "READ_FRIENDS";
        public static const ReadFriendsPlayerState:String = "READ_FRIEND_PLAYER_STATE";
        public static const FindPlayerByName:String = "FIND_PLAYER_BY_NAME";
        public static const FindUsersByExactName:String = "FIND_USERS_BY_EXACT_NAME";
        public static const FindUsersBySubstrName:String = "FIND_USERS_BY_SUBSTR_NAME";
        public static const FindUsersByUserSummary:String = "FIND_USERS_BY_USER_SUMMARY";
        public static const ListFriends:String = "LIST_FRIENDS";
        public static const AddFriends:String = "ADD_FRIENDS";
        public static const GetUsersOnlineStatus:String = "GET_USERS_ONLINE_STATUS";
        public static const RemoveFriends:String = "REMOVE_FRIENDS";
        public static const FindPlayerByUniversalId:String = "FIND_PLAYER_BY_UNIVERSAL_ID";
        public static const GetSocialLeaderboard:String = "GET_SOCIAL_LEADERBOARD";
        public static const GetMultiSocialLeaderboard:String = "GET_MULTI_SOCIAL_LEADERBOARD";
        public static const ListAllLeaderboards:String = "LIST_ALL_LEADERBOARDS";
        public static const GetGlobalLeaderboard:String = "GET_GLOBAL_LEADERBOARD";
        public static const GetGlobalLeaderboardPage:String = "GET_GLOBAL_LEADERBOARD_PAGE";
        public static const GetGlobalLeaderboardView:String = "GET_GLOBAL_LEADERBOARD_VIEW";
        public static const GetGlobalLeaderboardVersions:String = "GET_GLOBAL_LEADERBOARD_VERSIONS";
        public static const GetCompletedTournament:String = "GET_COMPLETED_TOURNAMENT";
        public static const RewardTournament:String = "REWARD_TOURNAMENT";
        public static const PostScore:String = "POST_SCORE";
        public static const PostScoreDynamic:String = "POST_SCORE_DYNAMIC";
        public static const GetGroupSocialLeaderboard:String = "GET_GROUP_SOCIAL_LEADERBOARD";
        public static const GetSummaryDataForProfileId:String = "GET_SUMMARY_DATA_FOR_PROFILE_ID";
        public static const GetPlayersSocialLeaderboard:String = "GET_PLAYERS_SOCIAL_LEADERBOARD";
        public static const GetGlobalLeaderboardEntryCount:String = "GET_GLOBAL_LEADERBOARD_ENTRY_COUNT";
        
        public static const InitThirdParty:String = "initThirdParty";
        public static const PostThirdPartyLeaderboardScore:String = "postThirdPartyLeaderboardScore";
        public static const IncrementThirdPartyLeaderboardScore:String = "incrementThirdPartyLeaderboardScore";
        public static const LaunchAchievementUI:String = "launchAchievementUI";
        public static const PostThirdPartyLeaderboardAchievement:String = "postThirdPartyLeaderboardAchievement";
        public static const IsThirdPartyAchievementComplete:String = "isThirdPartyAchievementComplete";
        public static const ResetThirdPartyAchievements:String = "resetThirdPartyAchievements";
        public static const QueryThirdPartyAchievements:String = "queryThirdPartyAchievements";
        
        public static const GetInventory:String = "GET_INVENTORY";
        public static const CashInReceipt:String = "OP_CASH_IN_RECEIPT";
        public static const AwardVC:String = "AWARD_VC";
        public static const ConsumeVC:String = "CONSUME_VC";
        public static const GetPlayerVC:String = "GET_PLAYER_VC";
        public static const ResetPlayerVC:String = "RESET_PLAYER_VC";
        
        public static const AwardParentVC:String = "AWARD_PARENT_VC";
        public static const ConsumeParentVC:String = "CONSUME_PARENT_VC";
        public static const GetParentVC:String = "GET_PARENT_VC";
        public static const ResetParentVC:String = "RESET_PARENT_VC";
        
        public static const Send:String = "SEND";
        public static const UpdateEventData:String = "UPDATE_EVENT_DATA";
        public static const DeleteSent:String = "DELETE_SENT";
        public static const DeleteIncoming:String = "DELETE_INCOMING";
        public static const GetEvents:String = "GET_EVENTS";
        
        public static const UpdateIncrement:String = "UPDATE_INCREMENT";
        public static const ReadNextXplevel:String = "READ_NEXT_XPLEVEL";
        public static const ReadXpLevels:String = "READ_XP_LEVELS";
        public static const SetXpPoints:String = "SET_XPPOINTS";
        public static const ReadSubset:String = "READ_SUBSET";
        public static const ReadForCategory:String = "READ_FOR_CATEGORY";
        
        public static const Run:String = "RUN";
        public static const Tweet:String = "TWEET";
        
        public static const AwardAchievements:String = "AWARD_ACHIEVEMENTS";
        public static const ReadAchievements:String = "READ_ACHIEVEMENTS";
        public static const ReadAchievedAchievements:String = "READ_ACHIEVED_ACHIEVEMENTS";
        
        public static const SetPlayerRating:String = "SET_PLAYER_RATING";
        public static const ResetPlayerRating:String = "RESET_PLAYER_RATING";
        public static const IncrementPlayerRating:String = "INCREMENT_PLAYER_RATING";
        public static const DecrementPlayerRating:String = "DECREMENT_PLAYER_RATING";
        public static const ShieldOn:String = "SHIELD_ON";
        public static const ShieldOnFor:String = "SHIELD_ON_FOR";
        public static const ShieldOff:String = "SHIELD_OFF";
        public static const GetShieldExpiry:String = "GET_SHIELD_EXPIRY";
        public static const FindPlayers:String = "FIND_PLAYERS";
        public static const FindPlayersUsingFilter:String = "FIND_PLAYERS_USING_FILTER";
        
        public static const SubmitTurn:String = "SUBMIT_TURN";
        public static const UpdateMatchSummary:String = "UPDATE_SUMMARY";
        public static const Abandon:String = "ABANDON";
        public static const Complete:String = "COMPLETE";
        public static const ReadMatch:String = "READ_MATCH";
        public static const ReadMatchHistory:String = "READ_MATCH_HISTORY";
        public static const FindMatches:String = "FIND_MATCHES";
        public static const FindMatchesCompleted:String = "FIND_MATCHES_COMPLETED";
        public static const DeleteMatch:String = "DELETE_MATCH";
        
        public static const LastUploadStatus:String = "LAST_UPLOAD_STATUS";
        
        public static const ReadQuests:String = "READ_QUESTS";
        public static const ReadCompletedQuests:String = "READ_COMPLETED_QUESTS";
        public static const ReadInProgressQuests:String = "READ_IN_PROGRESS_QUESTS";
        public static const ReadNotStartedQuests:String = "READ_NOT_STARTED_QUESTS";
        public static const ReadQuestsWithStatus:String = "READ_QUESTS_WITH_STATUS";
        public static const ReadQuestsWithBasicPercentage:String = "READ_QUESTS_WITH_BASIC_PERCENTAGE";
        public static const ReadQuestsWithComplexPercentage:String = "READ_QUESTS_WITH_COMPLEX_PERCENTAGE";
        public static const ReadQuestsByCategory:String = "READ_QUESTS_BY_CATEGORY";
        
        public static const ReadGameStatisticsByCategory:String = "READ_GAME_STATISTICS_BY_CATEGORY";
        public static const ReadPlayerStatisticsByCategory:String = "READ_PLAYER_STATISTICS_BY_CATEGORY";
        
        public static const ReadMilestones:String = "READ_MILESTONES";
        public static const ReadMilestonesByCategory:String = "READ_MILESTONES_BY_CATEGORY";
        public static const ResetMilestones:String = "RESET_MILESTONES";
        
        public static const ReadCompletedMilestones:String = "READ_COMPLETED_MILESTONES";
        public static const ReadInProgressMilestones:String = "READ_IN_PROGRESS_MILESTONES";
        
        public static const Logout:String = "LOGOUT";
        public static const UpdateName:String = "UPDATE_NAME";
        
        public static const StartMatch:String = "START_MATCH";
        public static const CancelMatch:String = "CANCEL_MATCH";
        public static const CompleteMatch:String = "COMPLETE_MATCH";
        public static const EnableMatchMaking:String = "ENABLE_FOR_MATCH";
        public static const DisableMatchMaking:String = "DISABLE_FOR_MATCH";
        
        public static const StartStream:String = "START_STREAM";
        public static const ReadStream:String = "READ_STREAM";
        public static const EndStream:String = "END_STREAM";
        public static const DeleteStream:String = "DELETE_STREAM";
        public static const AddEvent:String = "ADD_EVENT";
        public static const GetStreamSummariesForInitiatingPlayer:String = "GET_STREAM_SUMMARIES_FOR_INITIATING_PLAYER";
        public static const GetStreamSummariesForTargetPlayer:String = "GET_STREAM_SUMMARIES_FOR_TARGET_PLAYER";
        
        public static const GetUserInfo:String = "GET_USER_INFO";
        
        public static const StartSteamTransaction:String = "START_STEAM_TRANSACTION";
        public static const FinalizeSteamTransaction:String = "FINALIZE_STEAM_TRANSACTION";
        public static const VerifyMicrosoftReceipt:String = "VERIFY_MICROSOFT_RECEIPT";
        public static const ConfirmGooglePlayPurchase:String = "CONFIRM_GOOGLEPLAY_PURCHASE";
        public static const ConfirmFacebookPurchase:String = "FB_CONFIRM_PURCHASE";
        public static const EligiblePromotions:String = "ELIGIBLE_PROMOTIONS";
        
        public static const ReadSharedEntitesList:String = "READ_SHARED_ENTITIES_LIST";
        public static const GetList:String = "GET_LIST";
        public static const GetListByIndexedId:String = "GET_LIST_BY_INDEXED_ID";
        public static const GetListCount:String = "GET_LIST_COUNT";
        public static const GetPage:String = "GET_PAGE";
        public static const GetPageOffset:String = "GET_PAGE_BY_OFFSET";
        public static const IncrementUserEntityData:String = "INCREMENT_USER_ENTITY_DATA";
        public static const IncrementSharedUserEntityData:String = "INCREMENT_SHARED_USER_ENTITY_DATA";
        public static const IncrementGlobalEntityData:String = "INCREMENT_GLOBAL_ENTITY_DATA";
        
        public static const GetAttributes:String = "GET_ATTRIBUTES";
        public static const UpdateAttributes:String = "UPDATE_ATTRIBUTES";
        public static const RemoveAttributes:String = "REMOVE_ATTRIBUTES";
        public static const UpdatePlayerPicture:String = "UPDATE_PICTURE_URL";
        public static const UpdateContactEmail:String = "UPDATE_CONTACT_EMAIL";
        
        public static const ReadProperties:String = "READ_PROPERTIES";
        
        public static const GetUpdatedFiles:String = "GET_UPDATED_FILES";
        public static const GetFileList:String = "GET_FILE_LIST";
        
        public static const ScheduleCloudScript:String = "SCHEDULE_CLOUD_SCRIPT";
        public static const RunParentScript:String = "RUN_PARENT_SCRIPT";
        public static const CancelScheduledScript:String = "CANCEL_SCHEDULED_SCRIPT";
        public static const RunPeerScript:String = "RUN_PEER_SCRIPT";
        public static const RunPeerScriptAsync:String = "RUN_PEER_SCRIPT_ASYNC";
        
        public static const RedeemCode:String = "REDEEM_CODE";
        public static const GetRedeemedCodes:String = "GET_REDEEMED_CODES";
        
        public static const CustomPageEvent:String = "CUSTOM_PAGE_EVENT";
        public static const CustomScreenEvent:String = "CUSTOM_SCREEN_EVENT";
        public static const CustomTrackEvent:String = "CUSTOM_TRACK_EVENT";
        
        // profanity
        public static const ProfanityCheck:String = "PROFANITY_CHECK";
        public static const ProfanityReplaceText:String = "PROFANITY_REPLACE_TEXT";
        public static const ProfanityIdenitfyBadWords:String = "PROFANITY_IDENTIFY_BAD_WORDS";
        
        // file
        public static const PrepareUserUpload:String = "PREPARE_USER_UPLOAD";
        public static const ListUserFiles:String = "LIST_USER_FILES";
        public static const DeleteUserFiles:String = "DELETE_USER_FILES";
        public static const GetCdnUrl:String = "GET_CDN_URL";
        
        // group
        public static const AcceptGroupInvitation:String = "ACCEPT_GROUP_INVITATION";
        public static const AddGroupMember:String = "ADD_GROUP_MEMBER";
        public static const ApproveGroupJoinRequest:String = "APPROVE_GROUP_JOIN_REQUEST";
        public static const AutoJoinGroup:String = "AUTO_JOIN_GROUP";
        public static const CancelGroupInvitation:String = "CANCEL_GROUP_INVITATION";
        public static const CreateGroup:String = "CREATE_GROUP";
        public static const CreateGroupEntity:String = "CREATE_GROUP_ENTITY";
        public static const DeleteGroup:String = "DELETE_GROUP";
        public static const DeleteGroupEntity:String = "DELETE_GROUP_ENTITY";
        public static const DeleteGroupMemeber:String = "DELETE_MEMBER_FROM_GROUP";
        public static const GetMyGroups:String = "GET_MY_GROUPS";
        public static const IncrementGroupData:String = "INCREMENT_GROUP_DATA";
        public static const IncrementGroupEntityData:String = "INCREMENT_GROUP_ENTITY_DATA";
        public static const InviteGroupMember:String = "INVITE_GROUP_MEMBER";
        public static const JoinGroup:String = "JOIN_GROUP";
        public static const LeaveGroup:String = "LEAVE_GROUP";
        public static const ListGroupsPage:String = "LIST_GROUPS_PAGE";
        public static const ListGroupsPageByOffset:String = "LIST_GROUPS_PAGE_BY_OFFSET";
        public static const ListGroupsWithMember:String = "LIST_GROUPS_WITH_MEMBER";
        public static const ReadGroup:String = "READ_GROUP";
        public static const ReadGroupData:String = "READ_GROUP_DATA";
        public static const ReadGroupEntitiesPage:String = "READ_GROUP_ENTITIES_PAGE";
        public static const ReadGroupEntitiesPageByOffset:String = "READ_GROUP_ENTITIES_PAGE_BY_OFFSET";
        public static const ReadGroupEntity:String = "READ_GROUP_ENTITY";
        public static const ReadGroupMembers:String = "READ_GROUP_MEMBERS";
        public static const RejectGroupInvitation:String = "REJECT_GROUP_INVITATION";
        public static const RejectGroupJoinRequest:String = "REJECT_GROUP_JOIN_REQUEST";
        public static const RemoveGroupMember:String = "REMOVE_GROUP_MEMBER";
        public static const UpdateGroupData:String = "UPDATE_GROUP_DATA";
        public static const UpdateGroupEntity:String = "UPDATE_GROUP_ENTITY_DATA";
        public static const UpdateGroupMember:String = "UPDATE_GROUP_MEMBER";
        public static const UpdateGroupName:String = "UPDATE_GROUP_NAME";
        
        //mail
        public static const SendBasicEmail:String = "SEND_BASIC_EMAIL";
        public static const SendAdvancedEmail:String = "SEND_ADVANCED_EMAIL";       
        
        //Tournament
        public static const GetTournamentStatus:String = "GET_TOURNAMENT_STATUS";      
        public static const JoinTournament:String = "JOIN_TOURNAMENT";      
        public static const LeaveTournament:String = "LEAVE_TOURNAMENT";      
        public static const PostTournamentScore:String = "POST_TOURNAMENT_SCORE";      
        public static const ViewCurrentReward:String = "VIEW_CURRENT_REWARD";      
        public static const ViewReward:String = "VIEW_REWARD";      
        public static const ClaimTournamentReward:String = "CLAIM_TOURNAMENT_REWARD";              
	}
}