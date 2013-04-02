package com.ssmith1975.math {
	
	public class Polar {
		var _radius:Number;
		var _angle:Number;
		
		public function Polar(r:Number = 0, a:Number = 0) {
			_radius = r;
			_angle = a;
		}
		
		public function get radius():Number {
			return _radius;
		}
		
		public function set radius(r:Number):void {
			_radius = r;
		}

		public function get angle():Number {
			return _angle;
		}
		
		public function set angle(a:Number):void {
			_angle = a;
		}		
		
	}
}