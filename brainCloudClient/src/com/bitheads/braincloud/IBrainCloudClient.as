package com.bitheads.braincloud
{
    import com.bitheads.braincloud.IServiceMessage;
    import com.facebook.graph.data.FacebookAuthResponse;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.TimerEvent;

    /**
     * com.bitheads.braincloud.IBrainCloudClient
     *
     * @author Sherri Flemings
     */
    public interface IBrainCloudClient
    {
        /**
         * When user is authenticated, the sessionId should be stored here.
         */
        function getSessionId() : String;
        
        /**
         * The target url for all server calls.
         */
        function getUrl() : String;
        
        /**
         * Clears all pending and in progress messages from the message queue(s).
         */
        function resetCommunication() : void;
        
        /**
         * Handler for the _heartbeatTimer. This will send a call to the 
         * heartbeat service, which in turn will push any events waiting on 
         * the server down to the client.
         * 
         * @param    in_event
         */
         function onHeartbeat(in_event : TimerEvent) : void;
         
         /**
          * Sends a service request message to the server. This will most likely be placed 
          * in a queue...
          * 
          * @param    in_serviceMessage
          */
         function sendRequest(in_serviceMessage : IServiceMessage) : void;
         
         /**
          * Event handler to monitor progress of the sendRequest message.
          * 
          * @param    in_event
          */
         function onSendProgress(in_event : ProgressEvent) : void;
         
         /**
          * Success handler for the sendRequest message.
          * 
          * @param    in_event
          */
         function onSendComplete(in_event : Event) : void;
         
         /**
          * Failure handler for the sendRequest message.
          * 
          * @param    in_event
          */
         function onSendError(in_event : IOErrorEvent) : void;
         
         /**
          * Is the current user authenticated.
          * 
          * @return
          */
        function isAuthenticated() : Boolean;
         
         /**
          *  Authenticate the user with Brain Cloud
          * 
          * @param    in_userId                : current user ID
          * @param    in_authenticationToken     : authentication token
          * @param    in_responseHandler       : Message Response
          */
        function authenticate( in_userId:String, in_authenticationToken:String, in_responseHandler:IServiceResponse ):void;
        
        /**
          *  Create a NEW entity
          * 
          * @param    in_entityId            : entityID to update
          * @param    in_entityType         : entity type
          * @param    in_entitySubType       : sub type
          * @param    in_entityData       : json Object
          * @param     in_responseHandler     : Message Response OPTIONAL
          */
        function createEntity( in_entityId:int, in_entityType:String, in_entitySubType:String, in_entityData:Object, in_responseHandler:IServiceResponse = null ):void;
         
        /**
          *  Update an existing entity
          * 
          * @param    in_entityId            : entityID to update
          * @param    in_entityType         : entity type
          * @param    in_entitySubType       : sub type
          * @param    in_entityData       : json Object
          * @param     in_responseHandler     : Message Response 
          */
        function updateEntity( in_entityId:int, in_entityType:String, in_entitySubType:String, in_entityData:Object, in_responseHandler:IServiceResponse = null ):void;
         
        /**
          *  Read all data associated with the currently logged in player
          * 
          * @param     in_responseHandler     : Message Response
          * @param    entityTypeFilter     : OPTIONAL
          */
        function readPlayerState( in_responseHandler:IServiceResponse, entityTypeFilter:String = null ):void
        
        /**
          *  Remove player and all its data, please be mindful when using this
          * 
          * @param    in_userId                 : OPTIONAL
          * @param    in_authenticationToken     : OPTIONAL
          * @param     in_responseHandler         : Message Response
          */
        function resetPlayerState( in_userId:String, in_authenticationToken:String, in_responseHandler:IServiceResponse ):void;
        
        /**
         * read all your friends data
         * @param    in_entityId            : entity ID
         * @param    in_entityType        : type
         * @param    in_responseHandler    : OPTIONAL
         */
        function deleteEntity( in_entityId:int, in_entityType:String, in_responseHandler:ServiceResponse = null ):void;    
        
        /**
         *  Updates your friends' summary data
         * @param    in_friendSummaryObject    : Object defined by game, ie {"xp":123, "level":12,"highScore":45123}; 
         * @param     in_responseHandler        : Message Response
         */
        function updateSummaryFriendData(in_friendSummaryObject:Object, in_responseHandler:IServiceResponse ):void;
        
        /**
         * read all your friends data
         * @param    in_responseHandler    : Message Response
         */
        function readSummaryFriendData(in_responseHandler:IServiceResponse ):void
        
         /**
         * Create a new event to send to a friend.  The event should have an associated "type".
         *
         * @param toId                         : Id of the the event recipient
         * @param eventType                 : String description identifying the type of event
         * @param eventId                     : The id given to the event
         * @param jsonEventData                : JSON object holding the details of the event
         * @param recordLocally                : Flag to indicate whether or not to save an entry in the user's sent events for this event
         * @param in_responseHandler        : The method to be invoked when the server response is received
         */
        function sendEvent( toID:String, eventType:String, eventID:String, jsonEventData:Object, recordLocally:Boolean, in_responseHandler:IServiceResponse = null ):void;

        /**
         * Update event data for and event in the user's inbox.
         *
         * @param fromId                     : Id of the the event sender
         * @param eventId                     : The id given to the event
         * @param data                         : JSON object containing the update
         * @param in_responseHandler         : The method to be invoked when the server response is received
         */
        function updateEventData( fromId:String, eventID:String, jsonEventData:Object, in_responseHandler:IServiceResponse = null):void;
        
        /**
         * Delete an event sent to the current user.
         * It is assumed the event has already been processed before calling
         * this method.
         *
         * @param fromId                 : Id of the event sender
         * @param eventId                 : Id of the event
         * @param in_responseHandler    : The method to be invoked when the server response is received
         */
        function deleteIncomingEvent( fromId:String, eventId:String, in_responseHandler:IServiceResponse = null ):void;
        
        /**
         * Delete an event sent to a particular user from
         * the sender's sent events store.
         * This only applies to events sent with the recordLocally flag.
         * It is assumed the event has already been processed before calling
         * this method.
         *
         * @param toId                     : Id of the event receiver
         * @param eventId                 : Id of the event
         * @param in_responseHandler     : The method to be invoked when the server response is received
         */
        function deleteSentEvent(toId:String, eventId:String, in_responseHandler:IServiceResponse = null ):void
        
        /**
         * Get social leaderboard. This will return a list of facebook friends with their
         * highest recorded score and other friends' facebook data. This list will also include the 
         * current players best recorded score and facebook data.
         * Note: If a friend has not yet played the game, than the bestScore, createdAt, updatedAt
         * will contain NULL. 
         * @param in_replaceName        : Use this boolean to replace current players name to "You"
         * @param in_responseHandler     : The callback for retreiving the list
         */
        function getSocialLeaderboard( in_replaceName:Boolean, in_responseHandler:IServiceResponse ):void;

        /**
         * Post the current players score to the server. Server will only record the highest score in
         * the social leaderboard.
         * @param in_score                 : Current Players score
         * @param in_data                 : optional data to save with the score.
         * @param in_responseHandler     : Message Response
         */
        function postScore( in_score:Number, in_data:Object, in_responseHandler:IServiceResponse ):void;
        
        /**
         * Reset the score for the current player.
         * @param in_responseHandler     : Message Response
         */
        function resetScore( in_responseHandler:IServiceResponse ):void;

        /**
        * Get the sales inventory from the server
        * @param in_type                 : Refer to INVENTORY_TYPE_*
        * @param in_currency             : The currency code for products in question, 
        *                                 if not found it defaults to the first item in the list
        * @param in_responseHandler     : Message Response
        */
        function getSalesInventory( in_type:String, in_currency:String, in_responseHandler:IServiceResponse ):void;
        
        /**
        * Award player virtual currency
        * @param in_type                 : Refer to VIRTUAL_CURRENCY_TYPE_*
        * @param in_vcAmount             : The Amount of the Resource to award
        * @param in_responseHandler     : Message Response
        */
        function awardPlayerVC( in_type:String, in_vcAmount:Number, in_responseHandler:IServiceResponse ):void;

        /**
        * Award player virtual currency
        * @param in_type                 : Refer to VIRTUAL_CURRENCY_TYPE_*
        * @param in_vcAmount             : The Amount of the Resource to consume
        * @param in_responseHandler     : Message Response
        */
        function consumePlayerVC( in_type:String, in_vcAmount:Number, in_responseHandler:IServiceResponse ):void;
        
        /**
        * Get players virtual currency
        * @param in_type                 : Refer to VIRTUAL_CURRENCY_TYPE_*
        * @param in_responseHandler     : Message Response
        */
        function getPlayerVC( in_type:String, in_responseHandler:IServiceResponse ):void;

        /**
        * Resets the players' virtual Currency
        * @param in_responseHandler     : Message Response
        */
        function resetPlayerVC( in_responseHandler:IServiceResponse ):void;
        
         /**
         * Increment player statistics.  Data should be a JSON encoded series of statistic names
         * and the incremental updates. Example as follows:
         * {
         *    stat1: 10,
         *    stat2: 5.5,
         * }
         * The statistic names must have a matching GameStatistic record on the server.
         * In the server project under "src/main/database" is a file "initGameStats.js"
         * which is a sample of a script that must be executed on the mongo database
         * with a server deployment. Names cannot use dot notation. Statistics can be long or
         * double.
         * The callback result includes the result of the increment. The interface supports 
         * concurrent updates from different clients.
         *
         * @param in_object                    : The new data to be sent to the server
         * @param in_responseHandler         : The callback for success or failure of the update increment
         *                                         (collisions are possible for child entities)
         */
        function updateIncrementConcurrentData(in_object:Object, in_responseHandler:IServiceResponse):void;
        
        /**
        * Reads the current concurrent Data.    
        * @param in_responseHandler     : Message Response
        */
        function readConcurrentData( in_responseHandler:IServiceResponse ):void;
        
        /**
         * Deletes the current statistics entry.
         */
         function deleteConcurrentDataEntry( in_responseHandler:IServiceResponse ):void;

         /**
         * http://braincloud.wikidot.com/data-topics:resetplayerstategamedata-api
         * Performs a reset of all game-related that is data stored for the player. 
         * Data excluded from the reset is comprised of virtual currency, credentials, 
         * and transactions (i.e. Apply, currency, and product).
         */
        function resetGameStateData( in_responseHandler:IServiceResponse ):void;
        
        /**
        * Read and parse the AB Test data from the AppServer S3 service.
        * Example: ../s3/cj2012-01-12/abTesting.json
        *
        * Sample content:
        * {
        *   "ab_tests":[
        *     {
        *       "name":"IAPBoostPurchase",
        *       "active":"true",
        *       "data":[
        *         {"id":"0","name":"SelectFrom3","min":0,"max":49},
        *         {"id":"1","name":"SelectFrom5","min":50,"max":99}
        *       ]
        *     },
        *     {
        *       "name":"ABTest2",
        *       "active":"true",
        *       "data":[
        *         {"id":"0","name":"SelectFrom3","min":0,"max":24},
        *         {"id":"1","name":"SelectFrom5","min":25,"max":49},
        *         {"id":"2","name":"SelectFrom8","min":50,"max":74},
        *         {"id":"3","name":"SelectFrom10","min":75,"max":99}
        *       ]
        *     }
        *   ]
        * }
        */
        function loadABTestData(in_url:String/*, in_responseHandler:IServiceResponse*/):void;
        
        /**
        * Get the abSelection (alternative) for the supplied AB test based on the players abTestingId.
        */
        function getABTest(in_abTestName:String):String;
        
        /**
         *  Verify with the server that the purchase was successful and not manipulated by the client in any way
         * @param     in_responseHandler     : Message Response
         * @param    in_signedRequest    : value received previously from a successful initial transaction with FB 
         * @see     "https://developers.facebook.com/docs/howtos/payments/fulfillment/#orderfulfillment"
         */
        function verifyPurchase( in_responseHandler:IServiceResponse, in_signedRequest:String):void;
        
    }
}
