package com.bitheads.braincloud 
{
	import com.facebook.graph.data.FacebookAuthResponse;
	import com.facebook.graph.Facebook;
	import com.playbrains.debugging.Logger;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Franco
	 */
	public class BrainCloudFBClient implements IBrainCloudFBClient, IEventDispatcher
	{	
		/**
		* Application's secret key, used for signature hash.
		* 
		* @todo Set this to your apps secret key
		*/	
		public var SECRET_KEY : String 			= "!@#awef#$%f54672";
		
		protected static const REQUEST_MESSAGE_LIMIT : uint = 50;
		protected static const REQUEST_TIMEOUT_DELAY : uint	= 15000; 	// in milliseconds
		protected static const REQUEST_RETRY_LIMIT : uint 	= 5; 		// number of times to retry sending message
		protected static const REQUEST_RETRY_DELAY : uint 	= 1000; 	// in milliseconds
		
		protected static const INTERNAL_META_GAME_ENTITY:String = "internal_meta_game_data_entity";
		protected static const INTERNAL_META_GAME_ENTITY_SUBTYPE:String = "internal_meta_game_data";
		protected static const STARTING_UNIQUE_ID:uint = 3000;	
		
		public static const INVENTORY_TYPE_FACEBOOK:String = "facebook";
		public static const INVENTORY_TYPE_ITUNES:String = "itunes";
		
		public static const AUTH_TYPE_FACEBOOK : String = "Facebook";
		public static const AUTH_TYPE_STUBBED : String = "Universal";
		
		public var FACEBOOK_APP_ID : String;
		public var GAME_ID : String;
	
		protected var _fnDebugOutput : Function;
        protected var _fnErrorOutput : Function;
		
		// so i'm keeping this here and NOT relying solely on the Facebook libraries AuthResponse
		// its unreliable [smrj]
		public var _currentFBAuthResponse:FacebookAuthResponse;
		
		public var _brainCloudClient : BrainCloudClient;
		
		private const FACEBOOK_TIMEOUT:Number = 10000;
		protected var m_facebookTimeoutTimer:Timer;
		protected var m_eventDispatcher:EventDispatcher;
		protected var m_loginOptions:Object;
		
		protected var m_authenticationType : String;
		
		/**
		 * 
		 * @param	in_url
		 */
		public function BrainCloudFBClient(in_url : String) 
		{
			_fnDebugOutput = trace;
			_fnErrorOutput = trace;
			_brainCloudClient = new BrainCloudClient();
			_brainCloudClient.initialize("eggies", SECRET_KEY, "blah", in_url);
			
			m_eventDispatcher = new EventDispatcher;
			m_facebookTimeoutTimer = new Timer( FACEBOOK_TIMEOUT, 1 );
			m_facebookTimeoutTimer.addEventListener( TimerEvent.TIMER, onFacebookTimeout );
			
			// Braincloud authentication is stubbed by default unless we manage to successfully 
			// initialize facebook
			m_authenticationType = BrainCloudFBClient.AUTH_TYPE_STUBBED;
		}
		
		/**
		 * 
		 * @param	in_loginOptions
		 * @param	in_accessToken
		 */
		public function startFacebook( in_loginOptions:Object, in_accessToken:String = null) : void 
		{
			m_loginOptions = in_loginOptions;
			m_facebookTimeoutTimer.reset();
			m_facebookTimeoutTimer.start();
			
			try
			{
				Facebook.addJSEventListener('auth.authResponseChange', onFBAuthResponseChange);
				
				initFacebook(onInitFacebook, in_loginOptions, in_accessToken );	
			}
			catch ( error:Error )
			{
				// An exception here usually means we are not using a browser. 
				var event:BrainCloudFBEvent = new BrainCloudFBEvent( BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_INIT );
				dispatchEvent( event);
			}
		}
		
		/**
		 * 
		 * @param	in_fnCallback
		 */
		public function loadUserInfo( in_facebookId:String, in_fnCallback:Function ):void
		{
			Facebook.api(in_facebookId, in_fnCallback );			
		}		
		
		public function getPrivateACL():Object 
		{
			var object:Object = new Object();
			object.other = 0;
			return object;
		}
		/**
		 * 
		 * @param	in_response
		 */
		private function onFBAuthResponseChange(in_response:Object) : void 
		{
			m_facebookTimeoutTimer.stop();
			 
			if (in_response != null )
			{
				if (in_response.status == "connected")
				{
					// also lets save this, because it seems that the getAuthresponse
					// is NOT working correctly anymore (or atleast unreliably) [smrj]
					_currentFBAuthResponse = new FacebookAuthResponse();
					_currentFBAuthResponse.fromJSON(in_response.authResponse)
					
					m_authenticationType = BrainCloudFBClient.AUTH_TYPE_FACEBOOK;
					dispatchEvent( new BrainCloudFBEvent(BrainCloudFBEvent.FACEBOOK_SUCCESS) );
				}
				else if (in_response.status === 'not_authorized')
				{
					dispatchEvent( new BrainCloudFBEvent(BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_AUTH) );
				}
				else
				{
					dispatchEvent( new BrainCloudFBEvent(BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_LOGIN) );
				}
			}
			else
			{
				dispatchEvent( new BrainCloudFBEvent(BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_LOGIN) );
			}
		}
		
		/**
		 * 
		 * @param	in_session
		 * @param	in_fail
		 */
		private function onInitFacebook(in_session:Object, in_fail:Object) : void
		{
			m_facebookTimeoutTimer.reset();
			Logger.debug("onInitFacebook  ");
			
			_fnDebugOutput( "onInitFacebook success=" + String(in_session) + ", fail: " + String( in_fail));
			
			if (in_session != null)
			{
				Facebook.getLoginStatus();
				
				// We're already logged in
				m_authenticationType = BrainCloudFBClient.AUTH_TYPE_FACEBOOK;
				//dispatchEvent( new BrainCloudFBEvent( BrainCloudFBEvent.FACEBOOK_SUCCESS ) );	
				
			}
			else
			{
				// This is a small hack to prevent a small bug that occurs in some browsers (eg: IE8) that causes
				// Facebook.login() to return null immediately and fail if called too soon right after Facebook.init()				
				var timer:Timer = new Timer(200, 1);
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer );
				timer.start();			
			}
		}
		
		/**
		 * 
		 * @param	in_timerEvent
		 */
		private function onTimer( in_timerEvent:TimerEvent ):void
		{
			m_facebookTimeoutTimer.reset();
			
			var timer:Timer = in_timerEvent.target as Timer;
			if ( timer != null )
			{
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer );
				_fnDebugOutput("Timer removed successfully");
			}
			
			_fnDebugOutput("Trying to log in");
			Facebook.login(onFacebookLogin, m_loginOptions );			
		}
		
		/**
		 * 
		 * @param	in_session
		 * @param	in_fail
		 */
		private function onFacebookLogin(in_session:Object, in_fail:Object):void
		{
			m_facebookTimeoutTimer.stop();
			
			if ( in_session != null )
			{
				//m_authenticationType = BrainCloudFBClient.AUTH_TYPE_FACEBOOK;
				//dispatchEvent( new BrainCloudFBEvent( BrainCloudFBEvent.FACEBOOK_SUCCESS ) );
			}
			else
			{
				dispatchEvent( new BrainCloudFBEvent( BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_LOGIN ) );
			}
		}
		
		/**
		 * 
		 * @param	in_event
		 */
		private function onFacebookTimeout( in_event:TimerEvent ):void
		{
			_fnErrorOutput("Facebook timed out");
			dispatchEvent( new BrainCloudFBEvent( BrainCloudFBEvent.FACEBOOK_FAIL, BrainCloudFBEvent.FB_ERROR_TIMEOUT ) );
			m_facebookTimeoutTimer.stop();
		}		

		/**
		 * 
		 */
		public function release():void
		{
			m_eventDispatcher = null;
			
			m_facebookTimeoutTimer.stop();
			
			Facebook.removeJSEventListener('auth.authResponseChange', onFBAuthResponseChange);
		}
		
		/**
		 * 
		 * @return
		 */
		public function getFacebookUserId():String
		{
			var fbAuth:FacebookAuthResponse = getFacebookAuthResponse();
			return fbAuth != null? fbAuth.uid : "";
		}
		
		/**
		 * 
		 * @return
		 */
		public function getFacebookAccessToken():String
		{
			var fbAuth:FacebookAuthResponse = getFacebookAuthResponse();
			return fbAuth != null? fbAuth.accessToken : "";
		}
		
		/**
		 * 
		 * @return
		 */
		public function isLoggedInToFacebook():Boolean
		{
			return m_authenticationType == BrainCloudFBClient.AUTH_TYPE_FACEBOOK;
		}
		
		/**
		 *  Get Facebook Auth Response Object
		 */
		public function getFacebookAuthResponse():FacebookAuthResponse 
		{
			var tempResponse:FacebookAuthResponse = Facebook.getAuthResponse();
			
			// so we seem to be having a problem with the tempResponse being saved 
			// from facebook, so we also save the response in _currentFBAuthResponse
			// and we will return either of these depending on the validity of them
			// [smrj]
			
			if (tempResponse != null && tempResponse.uid != null)
				return tempResponse;
			else
				return _currentFBAuthResponse;
		}
		
		/**
		 *  Post Data to the current users' wall
		 * @param 	in_type : You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_options: Object defined by game, ie {"message":"Message Stub", "title":"Title Stub","filters":['app_non_users'] };
		 * @see  
		 */
		public function postData(in_type:String, in_callBackFunction:Function = null, in_options:Object = null):void 
		{
			Facebook.ui("feed", in_options, in_callBackFunction, in_type);
		}
		
		/**
		 *  Choose friends to post on their wall
		 * @param 	in_type : You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @see  	"http://developers.facebook.com/docs/reference/dialogs/send/"
		 */
		public function sendMessage(in_type:String, in_options:Object = null):void 
		{
			Facebook.ui("send", in_options, null, in_type);
		}
		
		/**
		 *  Invite friends to your app
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_options: Object defined by game, ie {"message":"Message Stub", "title":"Title Stub","filters":['app_non_users'] }; 
		 * @param 	in_popupType : You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 */
		public function inviteFriendsToApp( in_callBackFunction:Function, in_options:Object, in_popupType:String):void 
		{
			Facebook.ui("apprequests", in_options, in_callBackFunction, in_popupType);
		}
		
		public function retrieveListOfFriends( in_callBackFunction:Function):void
		{
			var _query:String = "/me/friends?fields=id,name,installed,scores,games &limit=50 &";
			Facebook.api(_query, in_callBackFunction);
		}
		
		public function retrieveListOfInvitableFriends( in_callBackFunction:Function):void
		{
			var _queryInvitable:String = "/me/invitable_friends?fields=id,name,installed,games,picture &limit=50 &";
			Facebook.api(_queryInvitable, in_callBackFunction);
		}
		
		/**
		 *  Buy Items through facebook, please ensure to call BrainCloudClient::getSalesInventory(), first
		 * in order to specify the correct itemID.
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_url				: pointed to the fbServiceCallback appended with gameID and itemID
		 * 								: ie. "https://dev.braincloudservers.com/fbproductservice?gameId=eggies&itemId="+itemId
		 * @param 	in_popupType 		: You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @see 	"http://developers.facebook.com/docs/reference/dialogs/pay/"
		 * @see 	"http://developers.facebook.com/docs/tutorials/canvas-games/payments/"
		 */
		public function buyItem( in_callBackFunction:Function, in_url:String, in_popupType:String = "async"):void
		{
			var options:Object = { "action": "purchaseitem", "product":in_url, "quantity": 1 };
			// preston - fb no longer supports the "display" parameter for pay dialogs...
			//Facebook.ui("pay", options, in_callBackFunction, in_popupType);
			Facebook.ui("pay", options, in_callBackFunction);
		}
		
		
		/**
		 * get Mobile price points
		 * @param	in_callBackFunction 
		 */
		public function getMobilePricePoints(in_callBackFunction:Function):void
		{
			var _query:String = "/me?fields=payment_pricepoints &";
			Facebook.api(_query, in_callBackFunction);
		}
		
		/**
		 *  delete a facebook request based on its request ID, Facebook requests that the developer
		 *  handler deleting all requests for the app, Use QueryString in order to grab the parameters from 
		 *  URL
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_requestID			: the item specified from the list of items from getSalesInventory
		 * @see 	"https://developers.facebook.com/docs/requests/#deleting"
		 */
		public function deleteRequest( in_callBackFunction:Function, in_requestID:String):void
		{
			//build the full_request_id from request_id and user_id
			var fullRequestID:String = "/" + in_requestID + "_" + getFacebookUserId();
			Logger.info("deleting FB request >"+fullRequestID+"<");
									
			Facebook.deleteObject(fullRequestID, in_callBackFunction );
		}
		
		/**
		 * After loading the JavaScript SDK, call FB.init to initialize the SDK with your app ID. This will let you make calls against the Facebook API.
		 * Note: Some UI methods like stream.publish and stream.share can be used without registering an app or calling this method. 
		 * 			If you are using an app ID, all methods must be called after FB.init.
		 * 
		 * 	Ensure that FACEBOOK_APP_ID is updated, when creating your own extension of BrainCloudClient in the Constructor update FACEBOOK_APP_ID to be correct 
		 * @param	in_responseHandler
		 */
		public function initFacebook( in_callBackFunction:Function = null, in_options:Object = null, in_accessToken:String = null ):void
		{
			Facebook.init(FACEBOOK_APP_ID, in_callBackFunction, in_options, in_accessToken);
		}
		
		/**
		 *  Login to Facebook
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param 	in_options : ie Object = {scope:"publish_stream, user_photos, email, read_friendlists, read_stream, user_about_me"};
		 */
		public function loginFacebook(in_callBackFunction:Function = null,in_options:Object = null ):void 
		{
			Facebook.login(in_callBackFunction, in_options);
		}
		
		/* INTERFACE flash.events.IEventDispatcher */
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			m_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function dispatchEvent(event:Event):Boolean 
		{
			return m_eventDispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean 
		{
			return m_eventDispatcher.hasEventListener(type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			m_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function willTrigger(type:String):Boolean 
		{
			return m_eventDispatcher.willTrigger(type);
		}
		
	}

}