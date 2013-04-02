package com.ssmith1975.shapes {
	import flash.display.Shape;
	import flash.geom.Point;
	
	// Line
	
	public class Line extends Shape{
		private var _startPoint:Point = new Point();
		private var _finishPoint:Point = new Point();
		private var _lineStyle;
		private var _color:Number;
		
		public function Line(startPoint:Point, finishPoint:Point, color:Number=0x000000, lineStyle:Number=1) {
			this._startPoint = startPoint;
			this._finishPoint = finishPoint;
			this._lineStyle = lineStyle;
			this._color = color;
			
			createLine(this._startPoint, this._finishPoint, this._color, this._lineStyle);
		}
		
		public function setStart(startPoint:Point):void {
			this._startPoint = startPoint;
			createLine(this._startPoint, this._finishPoint, this._color, this._lineStyle);
		}
		public function getStart():Point{
			return this._startPoint;
		}
		
		public function setFinish(finishPoint:Point):void {
			this._finishPoint = finishPoint;
			createLine(this._startPoint, this._finishPoint, this._color, this._lineStyle);
		}
		public function getFinish():Point {
			return this._finishPoint;
		}
		
		public function setColor(color:Number):void {
			this._color = color;
			createLine(this._startPoint, this._finishPoint, color, this._lineStyle);
		}
		public function getColor():Number {
			return Number(this._color);
		}
		
		public function setLineStyle(lineStyle:Number):void {
			this._lineStyle = lineStyle;
			createLine(this._startPoint, this._finishPoint, this._color, this._lineStyle);
		}
		public function getSetLineStyle():Number {
			return this._lineStyle;
		}
		
		private function createLine(startPoint:Point, finishPoint:Point, color:Number, lineStyle):void {
			//trace(color);
			graphics.lineStyle(lineStyle, color);
			graphics.moveTo(startPoint.x,startPoint.y);
			graphics.lineTo(finishPoint.y,finishPoint.x);
		}
		
	}
	
}