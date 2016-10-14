package com.bitheads.braincloud 
{
	/**
	 * com.bitheads.braincloud.IBrainCloudFBClient
	 * @author Steve Jones
	 */
	public interface IBrainCloudFBClient 
	{
		/**
		 * Init and login to facebook
		 * @param 	in_loginOptions 	: ie Object = {scope:"publish_stream, user_photos, email, read_friendlists, read_stream, user_about_me"};
		 * @param	in_accessToken
		 */
		function startFacebook( in_loginOptions:Object, in_accessToken:String = null) : void 
		
		/**
		 *  Post Data to a wall
		 * @param 	in_type 			: You can use different options to post to different users ie. '/me/feed' will post on your feed 
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_options			: Object defined by game, ie  {
		 * 									source: 'http://xxx.jpg', picture: 'http://xxx.jpg', 
		 * 									message: 'body',link: 'http://apicturelocation.com',
		 * 									name: 'name', caption: 'caption', description: 'description'} 
		 * 
		 * @see  'http://developers.facebook.com/docs/reference/javascript/FB.api/'
		 */
		function postData(in_type:String, in_callBackFunction:Function = null, in_options:Object = null):void ;
		
		/**
		 *  Choose friends to send a message to
		 * @param 	in_type : You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @param	in_options: Object defined by game, ie {"message":"Message Stub", "title":"Title Stub","filters":['app_non_users'] };
		 * @see  	"http://developers.facebook.com/docs/reference/dialogs/send/"
		 */
		function sendMessage(in_type:String, in_options:Object = null):void 
		
		/**
		 *  Invite friends to your app
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_options			: Object defined by game, ie {"message":"Message Stub", "title":"Title Stub","filters":['app_non_users'] }; 
		 * @param 	in_popupType 		: You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @see 	"http://developers.facebook.com/docs/reference/javascript/FB.ui/"
		 */
		function inviteFriendsToApp( in_callBackFunction:Function, in_options:Object, in_popupType:String):void;
		
		/**
		 *  Buy Items through facebook, please ensure to call BrainCloudClient::getSalesInventory(), first
		 * in order to specify the correct itemID.
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_url				: pointed to the fbServiceCallback appended with gameID and itemID
		 * 								: ie. "https://dev.braincloudservers.com/fbproductservice?gameId=eggies&itemId="+itemId
		 * @param 	in_popupType 		: You can use these two options for diasplaying friends invitation window 'iframe' 'popup'
		 * @see 	"http://developers.facebook.com/docs/reference/dialogs/pay/"
		 * @see 	"http://developers.facebook.com/docs/credits/"
		 */
		function buyItem( in_callBackFunction:Function, in_url:String, in_popupType:String = "async"):void;
		
		/**
		 *  delete a facebook request based on its request ID, Facebook requests that the developer
		 *  handler deleting all requests for the app
		 * @param 	in_callBackFunction : function to call when this popup is accepted / dismissed
		 * @param	in_requestID			: the item specified from the list of items from getSalesInventory
		 * @see 	"https://developers.facebook.com/docs/requests/#deleting"
		 */
		function deleteRequest( in_callBackFunction:Function, in_requestID:String):void;
	}

}