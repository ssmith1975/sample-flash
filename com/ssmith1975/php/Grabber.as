﻿package com.ssmith1975.php {
	
	import flash.events.*;
	import flash.net.*;
	
	public class Grabber extends EventDispatcher {
		public var phpFile:String;
		public var remoteFile:String;
		public var req:URLRequest;
		private var vars:URLVariables = new URLVariables();
		private var loader:URLLoader = new URLLoader();
		public var data:String;
		
		public function Grabber() {
			
		}
		
		public function load(php:String, remote:String):void {
			phpFile = php;
			remoteFile = remote;
			req = new URLRequest(phpFile);
			vars.fileName = remoteFile;
			req.data = vars;
			req.method = URLRequestMethod.POST;
			loader.load(req);
			loader.addEventListener(Event.COMPLETE, contentLoaded);
		}
		
		private function contentLoaded(event:Event):void {
			data = loader.data;
			dispatchEvent(new Event(Event.COMPLETE));
		}
	} // end class
	
	
} // end package