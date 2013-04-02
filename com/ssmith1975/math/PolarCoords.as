package com.ssmith1975.math {
	import flash.geom.Point;
	import com.ssmith1975.math.CustomMath;
	
	// Convert polar coordinates into rectangle coordinates
	public class PolarCoords {
		private var _radius:Number;
		private var _angleRad:Number;
		private var _angleDeg;Number;
		//private var _isDegree:Boolean;

		private var _center:Point;
		//private var _coord:Point= new Point();	
		
		public function PolarCoords(radius:Number, angle:Number, center:Point, isDegree:Boolean=true){
			this._radius = radius;
			

			this._center =  new Point(center.x,center.y);
			
			
			//this._isDegree = isDegree;
			setDegRad(angle, isDegree);
			
			//updateCoords(this._radius, this._angleRad, this._center,this._isDegree);
			
		} // end constructor
		
		
/*		private function updateCoords(radius:Number, angle:Number, center:Point, isDegree:Boolean):void {
			//this._coord = new Point();
			this._coord.x = radius*Math.cos(angle) + center.x;
			this._coord.y =  radius*Math.sin(angle) + center.y;
			//trace(this._coord.x);
			//trace('-------------');
		}*/
		
		private function setDegRad(angle:Number, isDegree:Boolean = true):void {
			//this._isDegree = isDegree;
			
			if(isDegree) {
				this._angleDeg = angle;
				this._angleRad = CustomMath.deg2rad(angle);
			} else {
				this._angleRad = angle;
				this._angleDeg = CustomMath.rad2deg(angle);
			}			
		}
		
		// Radius
		public function getRadius():Number {
			return this._radius;
		}
		
		public function setRadius(radius:Number):void {
			this._radius = radius;
			//updateCoords(this._radius, this._angleRad, this._center, this._isDegree);
			
		}
		
		// Angle
		public function getAngle(isDegree:Boolean = true):Number {
			if(isDegree) {
				return this._angleDeg;
			} else {
				return this._angleRad;
			}
		}
		
		public function setAngle(angle:Number, isDegree:Boolean=true):void {
			setDegRad(angle, isDegree);
			//updateCoords(this._radius, this._angleRad, this._center, this._isDegree);
		}
		
		
		
		// Center
		public function getCenter():Point {
			return this._center;
		}
		
		public function setCenter(center:Point):void {
			this._center = center;
			//updateCoords(this._radius, this._angleRad, this._center, this._isDegree);
			
		}
		
		// Rectangle Coordinates
		
		public function get x():Number {
			return this._radius*Math.cos(this._angleRad) + this._center.x;
			
		}
		
		public function get y():Number {
			return this._radius*Math.sin(this._angleRad) + this._center.y;
		}
		
		
		
	} // end class
}// end package