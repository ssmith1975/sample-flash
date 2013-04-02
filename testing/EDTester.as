package {
	import flash.display.MovieClip;
	import flash.events.*;
	import EDTest;
	import Pentagon;
	
	
	public class EDTester extends MovieClip {

			
		//public var edTest:EDTest;
		
		public function EDTester(edTest:EDTest) {

			//edTest = new EDTest(mc);
			edTest.addEventListener(EDTest.HIT_CHANGE, onHitChange);
			
		}
		
		
		
		
		private function onHitChange(event:Event):void {
			var _ed:EDTest = EDTest(event.target); 
			trace('event target message: ' + _ed.message);
			//trace(ed.message);
		}
		
				
		
	}
	
} // end package