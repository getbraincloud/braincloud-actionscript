package
{

import com.bitheads.braincloud.BrainCloudClient;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.Timer;

/**
 * ...
 * @author
 */
public class Main extends Sprite
{

    public var APP_ID:String = "";	// Add your App Id
    public var SECRET:String = "";	// And your App Secret
    public var APP_VERSION:String = "1.0";
 
	var bc:BrainCloudClient;
	
    public function Main()
    {
		trace("Main");

		bc = new BrainCloudClient();
		
		//bc.initialize(APP_ID, SECRET, APP_VERSION);
		bc.initialize(APP_ID, SECRET, APP_VERSION);
		
		bc.authenticationService.anonymousId = bc.authenticationService.generateAnonymousId();
		
		bc.authenticationService.authenticateAnonymous(true, SuccessCallback, ErrorCallback, null);
		
		var updateTimer:Timer = new Timer(1, 0);
		updateTimer.addEventListener(TimerEvent.TIMER, OnUpdate);
		updateTimer.start();
		
	}
	
	public function OnUpdate(event:Event):void
	{
		bc.runCallbacks();
	}
	
	public function SuccessCallback(jsonObject:Object, cbObject:Object):void 
	{
		var jsonString:String = JSON.stringify(jsonObject);
		trace("SuccessCallback: " + jsonString);
	}
	
	public function ErrorCallback(statusCode:int, reasonCode:int, jsonObject:Object, cbObject:Object):void 
	{
		var jsonString:String = JSON.stringify(jsonObject);
		trace("ErrorCallback: " + jsonString);
	}
	
    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
    }
}

}