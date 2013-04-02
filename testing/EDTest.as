package {
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class EDTest extends EventDispatcher {
		
		protected var _mc:MovieClip = new MovieClip();
		protected var _message:String = "hi";
		
		// Event Contstant
		static public const HIT_ME:String = "hitMe";
		static public const HIT_CHANGE:String = "hitChange";
		
		// Contructor
		public function EDTest(mc:MovieClip) {
			_mc = mc;
			_mc.addEventListener(MouseEvent.CLICK,onHitMe);
			
		}
		
		public function set message(msg:String):void {
			_message = msg;
			trace("Fired event");

			dispatchEvent(new Event(HIT_CHANGE));
		}
		
		public function get message():String {
			return _message;
		}
		
		// Event Handler
		private function onHitMe(event:MouseEvent):void {
			trace("You've been hit!");
			dispatchEvent(new Event(HIT_ME));
		}
		
	} // end class
	
} // end package