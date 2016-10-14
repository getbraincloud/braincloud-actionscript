package com.bitheads.braincloud
{	
	public class ServerCall
	{
		private var _service:String;
		private var _operation:String;
		private var _data:Object;
		private var _successCallback:Function;
		private var _errorCallback:Function;
		private var _cbObject:Object;
		
		public function ServerCall(service:String, operation:String, data:Object, successCallback:Function, errorCallback:Function, cbObject:Object)
		{
			_service = service;
			_operation = operation;
			_data = data;
			_successCallback = successCallback;
			_errorCallback = errorCallback;
			_cbObject = cbObject;
		}
		
		/**
		 * Get the service name (or type) for this service. This value is usually mapped to
		 * a particular server key used to identify this service.
		 *
		 * @return name to identify what type of service this is.
		 */
		public function getServiceName():String
		{
			return _service;
		}
		
		/**
		 * Get the type of operation to perform with this service. This value usually represents
		 * a particular server method, ie: read, update, create...
		 * @return
		 */
		public function getOperation():String
		{
			return _operation;
		}
		
		/**
		 * Get the data needed to communicate with this service. This data object can be a strongly typed
		 * custom object used locally by your client application.
		 *
		 * @return
		 */
		public function getData():Object
		{
			return _data;
		}
		
		/**
		 * Wraps this service and it's data into an object. This data must be in a format the server is
		 * expecting. Typically the data is stored in key=value pairs, where each key is
		 * mapped to a server key.
		 *
		 * @return object ready for json encoding
		 */
		public function getJsonData():Object
		{			
			var formattedObject:Object = {"service": getServiceName(), "operation": getOperation(), "data": getData()};			
			return formattedObject;
		}
		
		public function getSuccessCallback():Function
		{
			return _successCallback;
		}
        
        public function getErrorCallback():Function
		{
			return _errorCallback;
		}
        
        public function getCallbackObject():Object
		{
			return _cbObject;
		}
	}
}