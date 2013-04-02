

package {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.ssmith1975.gallery.Image;
	
	public class ImageData extends EventDispatcher {
		private static const DATA_FILE:String = "data/slideshow.xml";
		private var _data:Array;
		
		private function onXMLLoaded(event:Event):void {
			_data = [];
			var loader:URLLoader = event.target as URLLoader;
			var xml:XML = new XML(loader.data);
			var images:XMLList = xml.slide;
			var numImages:uint = images.length();
			var image:XML;
			
			for(var i:uint=0; i<numImages; i++){
				image = images[i] as XML;
				_data.push(new Image(image.caption, "assets/images/"+image.source,"assets/images/thumbs/"+image.source));
				
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
			
		}
		
		public function load():void {
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onXMLLoaded);
			loader.load(new URLRequest(DATA_FILE));
		}
		
		
		public function getNameData():Array {
			var nameData:Array = [];
			var numImages:uint = _data.length;
			var image:Image;
			
			for (var i:uint=0; i<numImages;i++) {
				image = _data[i] as Image;
				nameData.push({label:image.name, data:image});
			}
			
			return nameData;
		}
		
		
		public function getThumbData():Array {
			var thumbData:Array = [];
			var numImages:uint = _data.length;
			var image:Image;
			
			for (var i:uint=0; i<numImages;i++) {
				image = _data[i] as Image;
				thumbData.push({label:"", source:image.thumb, data:image });
			}
			
			return thumbData;
			
		}
		
		
	}
	
	
}