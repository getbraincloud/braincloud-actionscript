package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import flash.system.fscommand;

    import com.bitheads.braincloud.BrainCloudClient;

    import CommsTest;
    import GroupTest;
    import ChatTest;
    
    public class Main extends Sprite 
    {
        public var APP_ID:String = "20001";
        public var SECRET:String = "4e51b45c-030e-4f21-8457-dc53c9a0ed5f";
        public var APP_VERSION:String = "1.0.0";
        public var SERVER_URL:String = "https://internal.braincloudservers.com/dispatcherv2";
        public var PARENT_LEVEL_NAME:String = "Master";
        public var CHILD_APP_ID:String = "20005";
        public var PEER_NAME:String = "peerapp";

        private var m_tests:Array = new Array();
        private var m_failedTests:Array = new Array();
        private var m_currentTestId:Number = 0;

        public function Main() 
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void 
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            
            trace("--- Unit Tests ---");

            loadIds();

            GroupTest.createTests(m_tests);
            CommsTest.createTests(m_tests);
            ChatTest.createTests(m_tests);
                
            BrainCloudClient.instance.initialize(APP_ID, SECRET, APP_VERSION, SERVER_URL);

            var timer:Timer = new Timer(10, 0)
            timer.addEventListener(TimerEvent.TIMER, onTimer);
            timer.start();

            var runTestsTimer:Timer = new Timer(100, 1)
            runTestsTimer.addEventListener(TimerEvent.TIMER, onRunTests);
            runTestsTimer.start();
        }

        private function loadIds():void
        {
            trace("IDS:");
            trace("  APP_ID = " + APP_ID);
            trace("  SECRET = " + SECRET);
            trace("  APP_VERSION = " + APP_VERSION);
            trace("  SERVER_URL = " + SERVER_URL);
            trace("  PARENT_LEVEL_NAME = " + PARENT_LEVEL_NAME);
            trace("  CHILD_APP_ID = " + CHILD_APP_ID);
            trace("  PEER_NAME = " + PEER_NAME);
        }

        private function onRunTests(timerEvent:TimerEvent):void
        {
            m_currentTestId = 0;

            runNextTest();
        }

        private function runNextTest():void
        {
            if (m_currentTestId >= m_tests.length)
            {
                onTestsFinished();
                return;
            }

            var test:Test = m_tests[m_currentTestId];
            ++m_currentTestId;

            trace("test: " + test.getName());

            // Callback tree, yay!
            test.before(function():void
            {
                test.run(function():void
                {
                    trace("[PASSED] " + test.getName());
                    test.after(function():void
                    {
                        runNextTest();
                    });
                }, function(err:Object):void
                {
                    trace("[FAILED] " + test.getName() + ": " + err);
                    m_failedTests.push(test);
                    test.after(function():void
                    {
                        runNextTest();
                    });
                });
            }, function():void
            {
                m_failedTests.push(test);
                runNextTest();
            });
        }

        private function onTestsFinished():void
        {
            trace("-------------------------------------------");
            trace(((m_failedTests.length > 0) ? "[FAILED] " : "[PASSED] ") + (m_tests.length - m_failedTests.length) + "/" + m_tests.length + " succeeded");
            if (m_failedTests.length > 0)
            {
                trace("Failing tests:")
                for each (var test:Test in m_failedTests)
                {
                    trace("  " + test.getName());
                }
            }

            fscommand("quit");
        }

        private function onTimer(timerEvent:TimerEvent):void
        {
            BrainCloudClient.instance.runCallbacks();
        }
    }
}
