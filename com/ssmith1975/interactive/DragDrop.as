package com.ssmith1975.interactive {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class DragDrop {
		//var parentObj:Object;
		
		public function DragDrop(mc:MovieClip) {
			
			mc.buttonMode = true;
						
			mc.addEventListener(MouseEvent.MOUSE_DOWN,onStartDrag);
			mc.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);							
		}
		private function onStartDrag(evt:MouseEvent):void {
			evt.target.startDrag();
			evt.target.parent.setChildIndex(evt.target,evt.target.parent.numChildren - 1); 
		}
		
		private function onStopDrag(evt:MouseEvent):void {
			evt.target.stopDrag();
		}		
	}
	
	
}