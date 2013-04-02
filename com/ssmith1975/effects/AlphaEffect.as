package com.ssmith1975.effects {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class AlphaEffect {
		
		public function AlphaEffect(mc:MovieClip) {
			mc.buttonMode = true;
			mc.addEventListener(MouseEvent.MOUSE_OVER,onMCOver);
			mc.addEventListener(MouseEvent.MOUSE_OUT, onMCOut);							
		}
		private function onMCOver(evt:MouseEvent):void {
			evt.target.alpha = 0.5;
		}
		
		private function onMCOut(evt:MouseEvent):void {
			evt.target.alpha = 1;
		}		
	}
	
	
}