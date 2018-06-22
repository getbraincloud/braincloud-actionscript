package com.bitheads.braincloud 
{
    public class ReasonCodes
    {
        public static const NO_REASON_CODE:int = 0;

        public static const INVALID_NOTIFICATION:int = 20200;

        public static const INVALID_REQUEST:int = 40001;

        public static const SWITCHING_FACEBOOK_MEMORY:int = 40201;
        public static const MERGING_MEMORY:int = 40202;
        public static const RECREATING_ANONYMOUS_MEMORY:int = 40203;
        public static const MOVING_ANONYMOUS_MEMORY:int = 40204;
        public static const LOGIN_SECURITY_ERROR:int = 40209;

        /// <summary>This means that you have provided a profile id
        /// but the identity lookup fails to find an identity entry.
        /// </summary>
        public static const MISSING_IDENTITY_ERROR:int = 40206;

        /// <summary>This means that you have provided a profile id and an
        /// identity that is matched to a different profile id.
        /// This is where you blank out the profile to allow the switch.
        /// </summary>
        public static const SWITCHING_PROFILES:int = 40207;

        /// <summary>This means that you provide a blank profile id and the
        /// identity doesn’t exist and forecCreate is false.
        ///</summary>
        public static const MISSING_PROFILE_ERROR:int = 40208;

        /// <summary>Raised when a security error occurs
        /// </summary>
        public static const SECURITY_ERROR:int = 40209;

        /// <summary>This happens when you try and detach the last non-anonymous
        /// identity from an account with confirmAnonymous set to false.
        /// </summary>
        public static const DOWNGRADING_TO_ANONYMOUS_ERROR:int = 40210;

        /// <summary>This occurs when you try and attach an identity type that already exists for that profile.
        /// You can have only one facebook identity for a particular profile
        /// </summary>
        public static const DUPLICATE_IDENTITY_TYPE:int = 40211;


        public static const MERGE_PROFILES:int = 40212;
        public static const INVALID_PROPERTY_NAME:int = 40213;
        public static const EMAIL_NOT_VALIDATED:int = 40214;

        public static const UNABLE_TO_GET_FRIENDS_FROM_FACEBOOK:int = 40300;
        public static const BAD_SIGNATURE:int = 40301;

        /// <summary>Cannot validate user
        /// </summary>
        public static const UNABLE_TO_VALIDATE_PLAYER:int = 40302;
        public static const UNABLE_TO_VALIDATE_USER:int = UNABLE_TO_VALIDATE_PLAYER;

        /// <summary>Session expired</summary>
        public static const PLAYER_SESSION_EXPIRED:int = 40303;
        public static const USER_SESSION_EXPIRED:int = PLAYER_SESSION_EXPIRED;
        

        /// <summary>SESSION NOT FOUND ERROR</summary>
        public static const NO_SESSION:int = 40304;

        public static const PLAYER_SESSION_MISMATCH:int = 40305;
        public static const USER_SESSION_MISMATCH:int = PLAYER_SESSION_MISMATCH;
        public static const OPERATION_REQUIRES_A_SESSION:int = 40306;

        /// <summary>User provided the wrong email and / or password</summary>
        public static const TOKEN_DOES_NOT_MATCH_USER:int = 40307;

        public static const EVENT_CAN_ONLY_SEND_TO_FRIEND_OR_SELF:int = 40309;
        public static const NOT_FRIENDS:int = 40310;
        public static const VC_BALANCE_CANNOT_BE_SPECIFIED:int = 40311;
        public static const VC_LIMIT_EXCEEDED:int = 40312;
        public static const UNABLE_TO_GET_MY_DATA_FROM_FACEBOOK:int = 40313;

        /// <summary>This happens when you provide invalid auth type string in either service.</summary>
        public static const INVALID_AUTHENTICATION_TYPE:int = 40315;

        /// <summary>You must have an active session in order to call this api</summary>
        public static const INVALID_GAME_ID:int = 40316;
        public static const INVALID_APP_ID:int = INVALID_GAME_ID;

        
        /// <summary>This product and receipt have already been claimed</summary>
        public static const APPLE_TRANS_ID_ALREADY_CLAIMED:int = 40317;

        public static const CLIENT_VERSION_NOT_SUPPORTED:int = 40318;
        public static const BRAINCLOUD_VERSION_NOT_SUPPORTED:int = 40319;
        public static const PLATFORM_NOT_SUPPORTED:int = 40320;
        public static const INVALID_PLAYER_STATISTICS_EVENT_NAME:int = 40321;
        public static const INVALID_USER_STATISTICS_EVENT_NAME:int = INVALID_PLAYER_STATISTICS_EVENT_NAME;
        
        /// <summary>App Version No Longer Supported</summary>
        public static const GAME_VERSION_NOT_SUPPORTED:int = 40322;
        public static const APP_VERSION_NOT_SUPPORTED:int = GAME_VERSION_NOT_SUPPORTED;
        
        public static const BAD_REFERENCE_DATA:int = 40324;
        public static const MISSING_OAUTH_TOKEN:int = 40325;
        public static const MISSING_OAUTH_VERIFIER:int = 40326;
        public static const MISSING_OAUTH_TOKEN_SECRET:int = 40327;
        public static const MISSING_TWEET:int = 40328;
        public static const FACEBOOK_PAYMENT_ID_ALREADY_PROCESSED:int = 40329;
        public static const DISABLED_GAME:int = 40330;
        public static const DISABLED_APP:int = DISABLED_GAME;
        public static const MATCH_MAKING_DISABLED:int = 40331;
        public static const UPDATE_FAILED:int = 40332;
        public static const INVALID_OPERATION:int = 40333;  // invalid operation for API call

        /// <summary>Player is currently in a match</summary>
        public static const MATCH_RANGE_ERROR:int = 40334;

        /// <summary>Player is currently in a match</summary>
        public static const PLAYER_IN_MATCH:int = 40335;

        /// <summary>Player is currently shielded</summary>
        public static const MATCH_PLAYER_SHIELDED:int = 40336;

        public static const MATCH_PLAYER_MISSING:int = 40337;

        /// <summary>Player is currently logged in</summary>
        public static const MATCH_PLAYER_LOGGED_IN:int = 40338;

        public static const INVALID_ITEM_ID:int = 40339;
        public static const MISSING_PRICE:int = 40340;
        public static const MISSING_USER_INFO:int = 40341;
        public static const MISSING_STEAM_RESPONSE:int = 40342;
        public static const MISSING_STEAM_TRANSACTION:int = 40343;
        public static const ENTITY_VERSION_MISMATCH:int = 40344;
        public static const MISSING_RECORD:int = 40345;
        public static const INSUFFICIENT_PERMISSIONS:int = 40346;
        public static const MISSING_IN_QUERY:int = 40347;
        public static const RECORD_EXPIRED:int = 40348;
        public static const INVALID_WHERE:int = 40349;
        public static const S3_ERROR:int = 40350;
        public static const INVALID_ATTRIBUTES:int = 40351;
        public static const IMPORT_MISSING_GAME_DATA:int = 40352;
        public static const IMPORT_MISSING_GAME_APP:int = IMPORT_MISSING_GAME_DATA;
        public static const IMPORT_SCHEMA_VERSION_TOO_OLD:int = 40353;
        public static const IMPORT_SCHEMA_VERSION_INVALID:int = 40355;

        /// <summary>Max Concurrent Player Count Reached</summary>
        public static const PLAYER_SESSION_LOGGED_OUT:int = 40356;

        public static const API_HOOK_SCRIPT_ERROR:int = 40357;
        public static const MISSING_REQUIRED_PARAMETER:int = 40358;
        public static const INVALID_PARAMETER_TYPE:int = 40359;
        public static const INVALID_IDENTITY_TYPE:int = 40360;
        public static const EMAIL_SEND_ERROR:int = 40361;
        public static const CHILD_ENTITY_PARTIAL_UPDATE_INVALID_DATA:int = 40362;
        public static const MISSING_SCRIPT:int = 40363;
        public static const SCRIPT_SECURITY_ERROR:int = 40364;
        public static const SERVER_SESSION_EXPIRED:int = 40365;
        public static const STREAM_DOES_NOT_EXIT:int = 40366;
        public static const STREAM_ACCESS_ERROR:int = 40367;
        public static const STREAM_COMPLETE:int = 40368;
        public static const INVALID_STATISTIC_NAME:int = 40369;
        public static const INVALID_HTTP_REQUEST:int = 40370;
        public static const GAME_LIMIT_REACHED:int = 40371;
        public static const APP_LIMIT_REACHED:int = GAME_LIMIT_REACHED;
        public static const GAME_RUNSTATE_DISABLED:int = 40372;
        public static const APP_RUNSTATE_DISABLED:int = GAME_RUNSTATE_DISABLED;
        public static const INVALID_COMPANY_ID:int = 40373;
        public static const INVALID_PLAYER_ID:int = 40374;
        public static const INVALID_TEMPLATE_ID:int = 40375;
        public static const MINIMUM_SEARCH_INPUT:int = 40376;

        /// <summary>Game has to parent to switch profile to</summary>
        public static const MISSING_GAME_PARENT:int = 40377;
        public static const MISSING_APP_PARENT:int = MISSING_GAME_PARENT;

        public static const GAME_PARENT_MISMATCH:int = 40378;
        public static const APP_PARENT_MISMATCH:int = GAME_PARENT_MISMATCH;
        public static const CHILD_PLAYER_MISSING:int = 40379;
        public static const MISSING_PLAYER_PARENT:int = 40380;
        public static const PLAYER_PARENT_MISMATCH:int = 40381;
        public static const MISSING_PLAYER_ID:int = 40382;
        public static const DECODE_CONTEXT:int = 40383;
        public static const INVALID_QUERY_CONTEXT:int = 40384;
        public static const GROUP_MEMBER_NOT_FOUND:int = 40385;
        public static const INVALID_SORT:int = 40386;
        public static const GAME_NOT_FOUND:int = 40387;
        public static const APP_NOT_FOUND:int = GAME_NOT_FOUND;
        public static const GAMES_NOT_IN_SAME_COMPANY:int = 40388;
        public static const APPS_NOT_IN_SAME_COMPANY:int = GAMES_NOT_IN_SAME_COMPANY;
        public static const IMPORT_NO_PARENT_ASSIGNED:int = 40389;
        public static const IMPORT_PARENT_CURRENCIES_MISMATCH:int = 40390;
        public static const INVALID_SUBSTITUION_ENTRY:int = 40391;
        public static const INVALID_TEMPLATE_STRING:int = 40392;
        public static const TEMPLATE_SUBSTITUTION_ERROR:int = 40393;
        public static const INVALID_OPPONENTS:int = 40394;
        public static const REDEMPTION_CODE_NOT_FOUND:int = 40395;
        public static const REDEMPTION_CODE_VERSION_MISMATCH:int = 40396;
        public static const REDEMPTION_CODE_ACTIVE:int = 40397;
        public static const REDEMPTION_CODE_NOT_ACTIVE:int = 40398;
        public static const REDEMPTION_CODE_TYPE_NOT_FOUND:int = 40399;
        public static const REDEMPTION_CODE_INVALID:int = 40400;
        public static const REDEMPTION_CODE_REDEEMED:int = 40401;
        public static const REDEMPTION_CODE_REDEEMED_BY_SELF:int = 40402;
        public static const REDEMPTION_CODE_REDEEMED_BY_OTHER:int = 40403;
        public static const SCRIPT_EMPTY:int = 40404;
        public static const ITUNES_COMMUNICATION_ERROR:int = 40405;
        public static const ITUNES_NO_RESPONSE:int = 40406;
        public static const ITUNES_RESPONSE_NOT_OK:int = 40407;
        public static const JSON_PARSING_ERROR:int = 40408;
        public static const ITUNES_NULL_RESPONSE:int = 40409;
        public static const ITUNES_RESPONSE_WITH_NULL_STATUS:int = 40410;
        public static const ITUNES_STATUS_BAD_JSON_RECEIPT:int = 40411;
        public static const ITUNES_STATUS_BAD_RECEIPT:int = 40412;
        public static const ITUNES_STATUS_RECEIPT_NOT_AUTHENTICATED:int = 40413;
        public static const ITUNES_STATUS_BAD_SHARED_SECRET:int = 40414;
        public static const ITUNES_STATUS_RECEIPT_SERVER_UNAVAILABLE:int = 40415;
        public static const ITUNES_RECEIPT_MISSING_ITUNES_PRODUCT_ID:int = 40416;
        public static const PRODUCT_NOT_FOUND_FOR_ITUNES_PRODUCT_ID:int = 40417;
        public static const DATA_STREAM_EVENTS_NOT_ENABLED:int = 40418;
        public static const INVALID_DEVICE_TOKEN:int = 40419;
        public static const ERROR_DELETING_DEVICE_TOKEN:int = 40420;
        public static const WEBPURIFY_NOT_CONFIGURED:int = 40421;
        public static const WEBPURIFY_EXCEPTION:int = 40422;
        public static const WEBPURIFY_FAILURE:int = 40423;
        public static const WEBPURIFY_NOT_ENABLED:int = 40424;
        public static const NAME_CONTAINS_PROFANITY:int = 40425;
        public static const NULL_SESSION:int = 40426;
        public static const PURCHASE_ALREADY_VERIFIED:int = 40427;
        public static const GOOGLE_IAP_NOT_CONFIGURED:int = 40428;
        public static const UPLOAD_FILE_TOO_LARGE:int = 40429;
        public static const FILE_ALREADY_EXISTS:int = 40430;
        public static const CLOUD_STORAGE_SERVICE_ERROR:int = 40431;
        public static const FILE_DOES_NOT_EXIST:int = 40432;
        public static const UPLOAD_ID_MISSING:int = 40433;
        public static const UPLOAD_JOB_MISSING:int = 40434;
        public static const UPLOAD_JOB_EXPIRED:int = 40435;
        public static const UPLOADER_EXCEPTION:int = 40436;
        public static const UPLOADER_FILESIZE_MISMATCH:int = 40437;
        public static const PUSH_NOTIFICATIONS_NOT_CONFIGURED:int = 40438;
        public static const MATCHMAKING_FILTER_SCRIPT_FAILURE:int = 40439;
        public static const ACCOUNT_ALREADY_EXISTS:int = 40440;
        public static const PROFILE_ALREADY_EXISTS:int = 40441;
        public static const MISSING_NOTIFICATION_BODY:int = 40442;
        public static const INVALID_SERVICE_CODE:int = 40443;
        public static const IP_ADDRESS_BLOCKED:int = 40444;
        public static const UNAPPROVED_SERVICE_CODE:int = 40445;
        public static const PROFILE_NOT_FOUND:int = 40446;
        public static const ENTITY_NOT_SHARED:int = 40447;
        public static const SELF_FRIEND:int = 40448;
        public static const PARSE_NOT_CONFIGURED:int = 40449;
        public static const PARSE_NOT_ENABLED:int = 40450;
        public static const PARSE_REQUEST_ERROR:int = 40451;
        public static const GROUP_CANNOT_ADD_OWNER:int = 40452;
        public static const NOT_GROUP_MEMBER:int = 40453;
        public static const INVALID_GROUP_ROLE:int = 40454;
        public static const GROUP_OWNER_DELETE:int = 40455;
        public static const NOT_INVITED_GROUP_MEMBER:int = 40456;
        public static const GROUP_IS_FULL:int = 40457;
        public static const GROUP_OWNER_CANNOT_LEAVE:int = 40458;
        public static const INVALID_INCREMENT_VALUE:int = 40459;
        public static const GROUP_VERSION_MISMATCH:int = 40460;
        public static const GROUP_ENTITY_VERSION_MISMATCH:int = 40461;
        public static const INVALID_GROUP_ID:int = 40462;
        public static const INVALID_FIELD_NAME:int = 40463;
        public static const UNSUPPORTED_AUTH_TYPE:int = 40464;
        public static const CLOUDCODE_JOB_NOT_FOUND:int = 40465;
        public static const CLOUDCODE_JOB_NOT_SCHEDULED:int = 40466;
        public static const GROUP_TYPE_NOT_FOUND:int = 40467;
        public static const MATCHING_GROUPS_NOT_FOUND:int = 40468;
        public static const GENERATE_CDN_URL_ERROR:int = 40469;
        public static const INVALID_PROFILE_IDS:int = 40470;
        public static const MAX_PROFILE_IDS_EXCEEDED:int = 40471;
        public static const PROFILE_ID_MISMATCH:int = 40472;
        public static const LEADERBOARD_DOESNOT_EXIST:int = 40473;
        public static const APP_LICENSING_EXCEEDED:int = 40474;
        public static const SENDGRID_NOT_INSTALLED:int = 40475;
        public static const SENDGRID_EMAIL_SEND_ERROR:int = 40476;
        public static const SENDGRID_NOT_ENABLED_FOR_APP:int = 40477;
        public static const SENDGRID_GET_TEMPLATES_ERROR:int = 40478;
        public static const SENDGRID_INVALID_API_KEY:int = 40479;
        public static const EMAIL_SERVICE_NOT_CONFIGURED:int = 40480;
        public static const INVALID_EMAIL_TEMPLATE_TYPE:int = 40481;
        public static const SENDGRID_KEY_EMPTY_OR_NULL:int = 40482;
        public static const BODY_TEMPLATE_CANNOT_COEXIST:int = 40483;
        public static const SUBSTITUTION_BODY_CANNOT_COEXIST:int = 40484;
        public static const INVALID_FROM_ADDRESS:int = 40485;
        public static const INVALID_FROM_NAME:int = 40486;
        public static const INVALID_REPLY_TO_ADDRESS:int = 40487;
        public static const INVALID_REPLY_TO_NAME:int = 40488;
        public static const FROM_NAME_WITHOUT_FROM_ADDRESS:int = 40489;
        public static const REPLY_TO_NAME_WITHOUT_REPLY_TO_ADDRESS:int = 40490;
        public static const CURRENCY_SECURITY_ERROR:int = 40491;
        public static const INVALID_PEER_CODE:int = 40492;
        public static const PEER_NO_LONGER_EXISTS:int = 40493;
        
        public static const CANNOT_MODIFY_TOURNAMENT_WITH_LEADERBOARD_SERVICE:int = 40494;
        public static const NO_TOURNAMENT_ASSOCIATED_WITH_LEADERBOARD:int = 40495;
        public static const TOURNAMENT_NOT_ASSOCIATED_WITH_LEADERBOARD:int = 40496;
        public static const PLAYER_ALREADY_TOURNAMENT_FOR_LEADERBOARD:int = 40497;
        public static const PLAYER_EARLY_FOR_JOINING_TOURNAMENT:int = 40498;
        public static const NO_LEADERBOARD_FOUND:int = 40499;
        public static const PLAYER_NOT_IN_TIME_RANGE_FOR_POSTSCORE_TOURNAMENT:int = 40500;
        public static const LEADERBOARD_ID_BAD:int = 40501;
        public static const SCORE_INPUT_BAD:int = 40502;
        public static const ROUND_STARTED_EPOCH_INPUT_BAD:int = 40503;
        public static const TOURNAMENT_CODE_INPUT_BAD:int = 40504;
        public static const PLAYER_NOT_ENROLLED_IN_TOURNAMENT:int = 40505;
        public static const LEADERBOARD_VERSION_ID_INVALID:int = 40506;
        public static const NOT_ENOUGH_BALANCE_TO_JOIN_TOURNAMENT:int = 40507;
        public static const PARENT_ALREADY_ATTACHED:int = 40508;
        public static const PEER_ALREADY_ATTACHED:int = 40509;
        public static const IDENTITY_NOT_ATTACHED_WITH_PARENT:int = 40510;
        public static const IDENTITY_NOT_ATTACHED_WITH_PEER:int = 40511;
        public static const LEADERBOARD_SCORE_UPDATE_ERROR:int = 40512;
        public static const ERROR_CLAIMING_REWARD:int = 40513;
        public static const NOT_ENOUGH_PARENT_BALANCE_TO_JOIN_TOURNAMENT:int = 40514;
        public static const NOT_ENOUGH_PEER_BALANCE_TO_JOIN_TOURNAMENT:int = 40515;
        public static const PLAYER_LATE_FOR_JOINING_TOURNAMENT:int = 40516;
        public static const VIEWING_REWARD_FOR_NON_PROCESSED_TOURNAMENTS:int = 40517;
        public static const NO_REWARD_ASSOCIATED_WITH_LEADERBOARD:int = 40518;
        public static const PROFILE_PEER_NOT_FOUND:int = 40519;
        public static const LEADERBOARD_IN_ACTIVE_STATE:int = 40520;
        public static const LEADERBOARD_IN_CALCULATING_STATE:int = 40521;
        public static const TOURNAMENT_RESULT_PROCESSING_FAILED:int = 40522;
        public static const TOURNAMENT_REWARDS_ALREADY_CLAIMED:int = 40523;
        public static const NO_TOURNAMENT_FOUND:int = 40524;
        public static const UNEXPECTED_ERROR_RANK_ZERO_AFTER_PROCESSING:int = 40525;
        public static const UNEXPECTED_ERROR_DELETING_TOURNAMENT_LEADERBOARD_SCORE:int = 40526;
        public static const INVALID_RUN_STATE:int = 40527;
        public static const LEADERBOARD_SCORE_DOESNOT_EXIST:int = 40528;
        public static const INITIAL_SCORE_NULL:int = 40529;

        public static const NO_TWITTER_CONSUMER_KEY:int = 500001;
        public static const NO_TWITTER_CONSUMER_SECRET:int = 500002;
        public static const INVALID_CONFIGURATION:int = 500003;
        public static const ERROR_GETTING_REQUEST_TOKEN:int = 500004;
        public static const ERROR_GETTING_ACCESS_TOKEN:int = 500005;

        public static const FACEBOOK_ERROR:int = 500010;
        public static const FACEBOOK_SECRET_MISMATCH:int = 500011;
        public static const FACEBOOK_AUTHENTICATION_ERROR:int = 500012;
        public static const FACEBOOK_APPLICATION_TOKEN_REQUEST_ERROR:int = 500013;
        public static const FACEBOOK_BAD_APPLICATION_TOKEN_SIGNATURE:int = 500014;

        /// <summary>
        /// Client defined value for a timeout detected client-side.
        /// </summary>
        public static const CLIENT_NETWORK_ERROR_TIMEOUT:int = 90001;
        public static const CLIENT_UPLOAD_FILE_CANCELLED:int = 90100;
        public static const CLIENT_UPLOAD_FILE_TIMED_OUT:int = 90101;
        public static const CLIENT_UPLOAD_FILE_UNKNOWN:int = 90102;
        public static const CLIENT_DISABLED:int = 90200;
        public static const DATABASE_ERROR:int = 40215;
        public static const PROPERTY_NOT_OVERRIDEABLE:int = 40216;
        public static const UNKNOWN_AUTH_ERROR:int = 40217;
        public static const DATABASE_INPUT_TOO_LARGE_ERROR:int = 40218;
        public static const MISSING_APP_EMAIL_ACCOUNT:int = 40219;
        public static const INVALID_DATABASE_FIELD_NAME:int = 40347;
        public static const INVALID_AMOUNT:int = 40385;
        public static const TOURNAMENT_NOTIFICATIONS_PROCESSING_FAILED:int = 40530;
        public static const ACL_NOT_READABLE:int = 40531;
        public static const INVALID_OWNER_ID:int = 40532;
        public static const IMPORT_MISSING_PEERS_DATA:int = 40533;
        public static const INVALID_CREDENTIAL:int = 40534;
        public static const GLOBAL_ENTITY_SECURITY_ERROR:int = 40535;
        public static const LEADERBOARD_SECURITY_ERROR:int = 40536;
        public static const NOT_A_SYSTEM_ENTITY:int = 40537;
        public static const CONTROLLER_ERROR:int = 40538;
        public static const EVENT_MISSING:int = 40539;
        public static const INVALID_XP_LEVEL:int = 40540;
        public static const INVALID_ITUNES_ID:int = 40541;
        public static const IMPORT_ERROR:int = 40542;
        public static const INVALID_ENTITY_TYPE:int = 40543;
        public static const FORM_ERROR:int = 40544;
        public static const INVALID_PARENT:int = 40545;
        public static const INVALID_CURRENCY:int = 40546;
        public static const INVALID_THRESHHOLD:int = 40547;
        public static const MATCH_ALREADY_EXISTS:int = 40548;
        public static const FRIEND_NOT_FOUND:int = 40549;
        public static const MATCH_NOT_FOUND:int = 40550;
        public static const MATCH_COMPLETE:int = 40551;
        public static const MATCH_NOT_STARTED:int = 40552;
        public static const MATCH_EXPIRED:int = 40553;
        public static const PLAYER_NOT_IN_MATCH:int = 40554;
        public static const INVALID_MATCH_VERSION:int = 40555;
        public static const INVALID_TURN_VERSION:int = 40556;
        public static const INVALID_DEVICE_TYPE:int = 40557;
        public static const DUPLICATE_ENTITY:int = 40558;
        public static const DUPLICATE_EVENT:int = 40559;
        public static const INVALID_LEADERBOARD_COUNT:int = 40560;
        public static const DUPLICATE_LEADERBOARD:int = 40561;
        public static const MICROSOFT_ERROR:int = 40562;
        public static const DUPLICATE_TOURNAMENT:int = 40563;
        public static const CREATE_SYSTEM_ENTITY_FAILED:int = 40564;
        public static const INVALID_MAX_NUM_STREAMS:int = 40565;
        public static const INVALID_PACKET_ID:int = 40566;
        public static const HOOK_ERROR:int = 40567;
        public static const INVALID_STREAM_ID:int = 40568;
        public static const INVALID_SCAN_CODE:int = 40569;
        public static const NO_CUSTOM_ENTITY_CONFIG_FOUND:int = 40570;
        public static const NO_CUSTOM_ENTITY_FOUND:int = 40571;
        public static const CLOUD_STORAGE_ERROR:int = 40572;
        public static const NO_CUSTOM_FIELD_CONFIG_FOUND:int = 40573;
        public static const MISSING_CUSTOM_ENTITY_QUERY:int = 40574;
        public static const INVALID_CUSTOM_ENTITY_JSON_WHERE:int = 40575;
        public static const INVALID_CUSTOM_ENTITY_JSON_FIELDS:int = 40576;
        public static const ENTITY_ID_NOT_CONFIGURED:int = 40577;
        public static const UNCONFIGURED_CUSTOM_FIELD_ERROR:int = 40578;
        public static const CUSTOM_ENTITY_SECURITY_ERROR:int = 40579;
        public static const CUSTOM_ENTITY_PARTIAL_UPDATE_INVALID_DATA:int = 40580;
        public static const TOURNAMENT_PLAY_HAS_NOT_STARTED:int = 40581;
        public static const TOURNAMENT_PLAY_HAS_ENDED:int = 40582;
        public static const NEW_CREDENTIAL_IN_USE:int = 40583;
        public static const OLD_CREDENTIAL_NOT_OWNED:int = 40584;
        public static const CLOUD_CODE_SECURITY_ERROR:int = 40585;
        public static const RTT_SERVER_NOT_FOUND:int = 40586;
        public static const RTT_CLIENT_NOT_FOUND:int = 40587;
        public static const NO_RTT_SERVERS_AVAILABLE:int = 40588;
        public static const PROFILE_SESSION_MISMATCH:int = 40589;
        public static const WAITING_FOR_ON_DEMAND_TOURNAMENT_TO_START:int = 40590;
        public static const CDN_URLS_NOT_SUPPORTED:int = 40591;
        public static const CLOUD_CONTAINER_ERROR:int = 40592;
        public static const MESSAGING_FEATURE_NOT_CONFIGURED:int = 40593;
        public static const CHAT_FEATURE_NOT_CONFIGURED:int = 40594;
        public static const MESSAGE_NOT_FOUND:int = 40595;
        public static const COLLECTION_CREATE_DISABLED:int = 40596;
        public static const LEADERBAORD_COLLECTION_CREATE_DISABLED:int = 40597;
        public static const MESSAGE_VERSION_MISMATCH:int = 40598;
        public static const MESSAGEBOX_VERSION_MISMATCH:int = 40599;
        public static const MESSAGE_TOO_LARGE:int = 40600;
        public static const FEATURE_NOT_ENABLED:int = 40601;
        public static const CHANNEL_NOT_FOUND:int = 40603;
        public static const MALFORMED_FORM_DATA:int = 40604;
        public static const MISSING_LAST_PACKET_RESPONSE:int = 40605;
        public static const PACKET_IN_PROGRESS:int = 40606;
        public static const LOBBY_MEMBER_NOT_FOUND:int = 40607;
        public static const LOBBY_TEAM_NOT_FOUND:int = 40608;
        public static const LOBBY_ENTRY_QUEUE_MEMBER_NOT_FOUND:int = 40609;
        public static const INVALID_HEADER_APP_ID:int = 40610;
        public static const LOBBY_TYPE_NOT_FOUND:int = 40611;
        public static const LOBBY_TEAM_FULL:int = 40612;
        public static const TWITTER_AUTH_ERROR:int = 500006;
        public static const TWITTER_ERROR:int = 500007;
        public static const NOT_TEAM_ADMIN:int = 550000;
        public static const NO_TEAM_ACCESS:int = 550001;
        public static const MISSING_COMPANY_RECORD:int = 550002;
        public static const TEAM_MEMBER_NOT_FOUND:int = 550003;
        public static const TEAM_MEMBER_NOT_ENABLED:int = 550004;
        public static const TEAM_MEMBER_NOT_ACTIVE:int = 550005;
        public static const TEAM_MEMBER_LOCKED:int = 550006;
        public static const INVALID_PASSWORD:int = 550007;
        public static const TOKEN_INVALID:int = 550008;
        public static const TOKEN_EXPIRED:int = 550009;
        public static const TEMPLATE_GAME_NOT_FOUND:int = 550011;
        public static const INVALID_TEMPLATE_GAME_TEAM:int = 550012;
        public static const BASIC_AUTH_FAILURE:int = 550013;
        public static const MONGO_DB_EXCEPTION:int = 600001;
        public static const CONCURRENT_LOCK_ERROR:int = 600002;
    }
}