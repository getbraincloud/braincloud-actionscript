package com.bitheads.braincloud
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
   
    /**
     * Singleton used to grab data out of the query string.
     *
     * @author Matt Przybylski [http://www.reintroducing.com]
	 * @author Steve Jones : Modifications to accept URL from an embedded movie
	 * 
	 * NOTE:: replace all occurences of '&' in your index.html to '~' so that this can parse it easily
	 * 		strings with & get truncated
	 * 		var flashvars = {};
			flashvars.url = window.location.href.toString().replace(/&/gi ,"~" );
     * @version 1.1
     */
    public class QueryString
    {
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
 
        private var _pairDict:Dictionary;
        private var _url:String;
        private var _pairs:Array;
       
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
       
       
       
//- CONSTRUCTOR -------------------------------------------------------------------------------------------
       
        public function QueryString(in_url:String)
        {
			_url = in_url;
			if (_url != null )
				parseValues();
        }
       
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
       
        private function parseValues():void
        {
			_pairDict = new Dictionary();
            _pairs = this._url.split("?")[1].split("~");
           
            var pairName:String;
            var pairValue:String;
			
            for (var i:int = 0; i <this._pairs.length; i++)
            {
                pairName = _pairs[i].split("=")[0];
                pairValue = _pairs[i].split("=")[1];
               
                this._pairDict[pairName] = pairValue;
            }
        }
       
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
   
        /**
         * Returns the value of the specified query string parameter.
         *
         * @param $val A string identifying the parameter for whose value you want to retrieve
         *
         * @return String The value for the given parameter
         */
        public function getValue($val:String):String
        {
            if (_pairDict == null || _pairDict[$val] == null)
            {
                return "";
            } 
            else
            {
                return _pairDict[$val];
            }
        }
   
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
   
       
   
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
   
       
   
//- HELPERS -----------------------------------------------------------------------------------------------
   
        public function toString():String
        {
            return getQualifiedClassName(this);
        }
   
//- END CLASS ---------------------------------------------------------------------------------------------
    }
}