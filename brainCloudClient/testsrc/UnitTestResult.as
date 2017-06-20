package
{
import asunit.framework.Assert;

import com.bitheads.braincloud.BrainCloudClient;
import com.bitheads.braincloud.ReasonCodes;
import com.bitheads.braincloud.StatusCodes;

import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.utils.StringUtil;

public class UnitTestResult
{

    public var isDone:Boolean;
    public var successResult:Boolean;
    public var apiCountExpected:int;

    public var responses:Object;

    public var statusCode:int;
    public var reasonCode:int;
    public var statusMessage:String;
    public var timeToWait:int;
    public var globalErrorCount:int;
    public var networkErrorCount:int;


    public var spinCallback:Function;
    public var spinTimeToWait:int;


    public function UnitTestResult()
    {

    }

    public function Reset():void
    {
        isDone = false;
        successResult = false;
        apiCountExpected = 0;
        responses = null;
        statusCode = 0;
        reasonCode = 0;
        statusMessage = null;
        globalErrorCount = 0;
        networkErrorCount = 0;
        timeToWait = 120;
        spinCallback = null;
        spinTimeToWait = 0;
    }

    public function Run(callback:Function):void
    {
        RunExpectCount(callback, 1);
    }

    public function RunExpectCount(callback:Function, apiCount:int):void
    {
        Reset();
        apiCountExpected = apiCount;

        Spin(function() {
            Assert.assertTrue(successResult)

            callback();
        }, timeToWait);
    }


    public function RunExpectFail(callback:Function, expectedStatusCode:int, expectedReasonCode:int):void
    {
        Reset();

        Spin(function() {
            Assert.assertFalse(successResult);

            if (expectedStatusCode != -1)
            {
                Assert.assertEquals(expectedStatusCode, statusCode);
            }
            if (expectedReasonCode != -1)
            {
                Assert.assertEquals(expectedReasonCode, reasonCode);
            }

            callback();
        }, timeToWait);
    }

    public function ApiSuccess(json:Object, cb:Object):void
    {

        Main.unitTests.getPrinter().println("[Call Success]");
        Main.unitTests.getPrinter().println(JSON.stringify(json.data));


        responses = json;

        successResult = true;
        --apiCountExpected;
        if (apiCountExpected <= 0)
        {
            isDone = true;
        }
    }

    public function ApiError(statusCode:int, reasonCode:int, jsonError:String, cb:Object):void
    {
        Main.unitTests.getPrinter().println("[Call Failure]");

        var stringFormat:String = "statusCode {0} reasonCode {1} jsonError {2}";
        Main.unitTests.getPrinter().println(StringUtil.substitute(stringFormat, statusCode, reasonCode, jsonError));


        this.statusCode = statusCode;
        this.reasonCode = reasonCode;
        this.statusMessage = jsonError;

        successResult = false;
        --apiCountExpected;

        if (apiCountExpected <= 0)
        {
            isDone = true;
        }
    }

    public function NetworkError():void
    {
        statusCode = StatusCodes.CLIENT_NETWORK_ERROR;
        reasonCode = ReasonCodes.CLIENT_NETWORK_ERROR_TIMEOUT;

        statusMessage = "Network Error";

        successResult = true;
        --apiCountExpected;
        if (apiCountExpected <= 0)
        {
            isDone = true;
        }
        ++networkErrorCount;
    }

    public function IsDone():Boolean
    {
        return isDone;
    }

    private function Spin(callback:Function, maxWait:int):void
    {
        spinCallback = callback;
        spinTimeToWait = maxWait;

        var timer:Timer = new Timer(10, 1)
        timer.addEventListener(TimerEvent.TIMER, onTimer);
        timer.start();
    }

    public function SetTimeToWaitSecs(seconds:int)
    {
        timeToWait = seconds;
    }

    private function onTimer(timerEvent:TimerEvent):void
    {
        var maxWait:int = timeToWait * 1000;

        if (!isDone && maxWait > 0)
        {
            BrainCloudClient.instance.runCallbacks();

            maxWait -= 10;

            Spin(spinCallback, maxWait);
        }
        else
        {
            spinCallback();
        }
    }
}
}