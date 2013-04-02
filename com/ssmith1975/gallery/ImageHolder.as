package com.ssmith1975.gallery {
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class ImageHolder extends Sprite {
		public function ImageHolder(file:String) {
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoaded);
			loader.load(new URLRequest(file));
		}
		private function onImageLoaded(event:Event):void {
			var loaderInfo:LoaderInfo = event.target as LoaderInfo;
			//loaderInfo.removeEventListener(Event.COMPLETE, onImageLoaded);
			addChild(loaderInfo.content);
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		
	}
}