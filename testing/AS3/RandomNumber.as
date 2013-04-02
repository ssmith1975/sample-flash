package {
	
	
	
	public class RandomNumber {
		private var _lowRange:int;
		private var _highRange:int;
		private var _rand:int;
		
		public function RandomNumber (lowRange:int, highRange:int) {
			_lowRange = lowRange;
			_highRange = _highRange;
			
		}
		
		private function findRandomNumber():int {
			
			_rand = (Math.round(Math.random()*(_highRange - _lowRange)) )+_lowRange;
			return _rand ;
		}
		
		public function getRandom():int {
			_rand = findRandomNumber();
			return _rand;
		}
	}
	
}