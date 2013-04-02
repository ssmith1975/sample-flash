package com.ssmith1975.flickr {
	import flash.net.*;
	import flash.events.*;
	
	public class Search extends EventDispatcher {
		private var req:URLRequest;
		public var info:URLVariables;
		private var loader:URLLoader = new URLLoader();
		public var feed:XML;
		
		public function Search() {
			
		} // end constructor
		
		public function search(searchStr:String):void {
			req = new URLRequest("http://api.flickr.com/services/feeds/photos_public.gne");
			info = new URLVariables();
			info.format = "rss_200";
			info.tags = searchStr;
			req.data = info;
			loader.load(req);
			loader.addEventListener(Event.COMPLETE, dataLoaded);
		}
		
		private function dataLoaded(event:Event):void {
			feed = new XML(loader.data);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	} // end class
	
} //end package