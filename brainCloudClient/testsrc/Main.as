package
{

import asunit.textui.TestRunner;

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

    public var APP_ID:String = "";
    public var SECRET:String = "";
    public var APP_VERSION:String = "";
    public var SERVER_URL:String = "";
    public var PARENT_LEVEL_NAME :String= "";
    public var CHILD_APP_ID:String = "";
    public var PEER_NAME:String = "";


    public static var unitTests:TestRunner;

    public function Main()
    {
        //Load for ids text file
        var file:File = File.userDirectory.resolvePath("ids.txt");
        var fileStream:FileStream = new FileStream();
        fileStream.open(file, FileMode.READ);
        var dataString:String = fileStream.readUTFBytes(file.size);
        fileStream.close();


        var stringList = dataString.split("\r\n");

        for each (var str in stringList)
        {
            if(str.indexOf("serverUrl") >= 0)
            {
                SERVER_URL = str.split("=")[1];
            }
            if(str.indexOf("appId") >= 0)
            {
                APP_ID = str.split("=")[1];
            }
            if(str.indexOf("secret") >= 0)
            {
                SECRET = str.split("=")[1];
            }
            if(str.indexOf("version") >= 0)
            {
                APP_VERSION = str.split("=")[1];
            }
            if(str.indexOf("parentLevelName") >= 0)
            {
                PARENT_LEVEL_NAME = str.split("=")[1];
            }
            if(str.indexOf("peerName") >= 0)
            {
                PEER_NAME = str.split("=")[1];
            }
        }

        BrainCloudClient.instance.initialize(APP_ID, SECRET, APP_VERSION, SERVER_URL);

        var timer:Timer = new Timer(10, 0)
        timer.addEventListener(TimerEvent.TIMER, onTimer);
        timer.start();

        var runTestsTimer:Timer = new Timer(100, 1)
        runTestsTimer.addEventListener(TimerEvent.TIMER, onRunTests);
        runTestsTimer.start();
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function onRunTests(timerEvent:TimerEvent):void
    {
        unitTests = new TestRunner();
        stage.addChild(unitTests);

        unitTests.start(TestSuiteAll, null, TestRunner.SHOW_TRACE);
    }


    private function onTimer(timerEvent:TimerEvent):void
    {
        BrainCloudClient.instance.runCallbacks();

    }

}

}