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
        public static const LOGIN_SECURITY_ERROR:int = 40205;

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

        /// <summary>Cannot validate player
        /// </summary>
        public static const UNABLE_TO_VALIDATE_PLAYER:int = 40302;

        /// <summary>Session expired</summary>
        public static const PLAYER_SESSION_EXPIRED:int = 40303;


        /// <summary>SESSION NOT FOUND ERROR</summary>
        public static const NO_SESSION:int = 40304;

        public static const PLAYER_SESSION_MISMATCH:int = 40305;
        public static const OPERATION_REQUIRES_A_SESSION:int = 40306;

        /// <summary>Player provided the wrong email and / or password</summary>
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

        /// <summary>This product and receipt have already been claimed</summary>
        public static const APPLE_TRANS_ID_ALREADY_CLAIMED:int = 40317;

        public static const CLIENT_VERSION_NOT_SUPPORTED:int = 40318;
        public static const BRAINCLOUD_VERSION_NOT_SUPPORTED:int = 40319;
        public static const PLATFORM_NOT_SUPPORTED:int = 40320;
        public static const INVALID_PLAYER_STATISTICS_EVENT_NAME:int = 40321;

        /// <summary>App Version No Longer Supported</summary>
        public static const GAME_VERSION_NOT_SUPPORTED:int = 40322;

        public static const BAD_REFERENCE_DATA:int = 40324;
        public static const MISSING_OAUTH_TOKEN:int = 40325;
        public static const MISSING_OAUTH_VERIFIER:int = 40326;
        public static const MISSING_OAUTH_TOKEN_SECRET:int = 40327;
        public static const MISSING_TWEET:int = 40328;
        public static const FACEBOOK_PAYMENT_ID_ALREADY_PROCESSED:int = 40329;
        public static const DISABLED_GAME:int = 40330;
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
        public static const GAME_RUNSTATE_DISABLED:int = 40372;
        public static const INVALID_COMPANY_ID:int = 40373;
        public static const INVALID_PLAYER_ID:int = 40374;
        public static const INVALID_TEMPLATE_ID:int = 40375;
        public static const MINIMUM_SEARCH_INPUT:int = 40376;

        /// <summary>Game has to parent to switch profile to</summary>
        public static const MISSING_GAME_PARENT:int = 40377;

        public static const GAME_PARENT_MISMATCH:int = 40378;
        public static const CHILD_PLAYER_MISSING:int = 40379;
        public static const MISSING_PLAYER_PARENT:int = 40380;
        public static const PLAYER_PARENT_MISMATCH:int = 40381;
        public static const MISSING_PLAYER_ID:int = 40382;
        public static const DECODE_CONTEXT:int = 40383;
        public static const INVALID_QUERY_CONTEXT:int = 40384;
        public static const GROUP_MEMBER_NOT_FOUND:int = 40385;
        public static const INVALID_SORT:int = 40386;
        public static const GAME_NOT_FOUND:int = 40387;
        public static const GAMES_NOT_IN_SAME_COMPANY:int = 40388;
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
	}
}