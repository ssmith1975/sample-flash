package com.ssmith1975.math {
	import flash.geom.Point;
	import com.ssmith1975.math.CustomMath;
	
	
	// Convert rectangle coordinates into polar coordinates
	public class RectCoords {
		private var _coord:Point;
		private var _center:Point;
		
		private var _radius:Number;
		private var _angleRad:Number;
		private var _angleDeg:Number;
		
		
		public function RectCoords(coord:Point, center:Point = null ) {
			this._coord = coord;
			
			if(center == null){
				center= new Point(0,0);
			}
			
			this._center = center;
			
			updatePolar(this._coord,this._center); 
		}
		
		private function updatePolar(coord:Point, center:Point):void {
			this._radius = CustomMath.getDistance(center.x, center.y, coord.x, coord.y);
			this._angleRad = CustomMath.getRadians(center.x, center.y, coord.x, coord.y);
			this._angleDeg = CustomMath.getDegrees(center.x, center.y, coord.x, coord.y);
			
		}
		// Center Coordinates
		public function getCenter():Point {
			return this._center;
		}
		public function setCenter(center:Point):void {
			this._center = center;
			updatePolar(this._coord, this._center);
		}
		
		// Rectangle Coordinates
		public function getCoord():Point {
			return this._coord;
		}
		public function setCoord(coord:Point):void {
			this._coord = coord;
		}
		
		// Polar 
		public function get radius():Number {
			return this._radius;
		}
		public function get angleRad():Number {
			return this._angleRad;
		}
		public function get angleDeg():Number {
			return this._angleDeg;
		}
	}
	
}