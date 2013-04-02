package com.ssmith1975.math {
	import flash.geom.Point;
	
	public class CustomMath {
		//Convert Degrees into Radians
		static public function deg2rad(theta:Number):Number {
			return theta*Math.PI/180;
		}
		
		//Convert Radians into Degrees
		static public function rad2deg(radians:Number):Number {
			return radians*180/Math.PI;
		}
		
		//Rotation returns radians
		static public function getRadians(xStart:Number, yStart:Number, xEnd:Number, yEnd:Number):Number {
			return Math.atan2(yEnd-yStart, xEnd-xStart);
		}
		
		//Rotation returns degree
		static public function getDegrees(xStart:Number, yStart:Number, xEnd:Number, yEnd:Number):Number {
			return CustomMath.rad2deg(Math.atan2(yEnd-yStart, xEnd-xStart));
		}
		
		//Distance between two points
		static public function getDistance(xStart:Number, yStart:Number, xEnd:Number, yEnd:Number):Number {
			return Math.sqrt(Math.pow((yEnd-yStart),2) + Math.pow((xEnd-xStart),2));
		}
	
		
		
		
		
	
	} // end class
	
	
} // end package