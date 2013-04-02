
package {
import flash.display.MovieClip;
import flash.events.Event;
import flash.utils.Timer;
import flash.events.TimerEvent;
import com.ssmith1975.math.RandomNumber;
import com.ssmith1975.motion.BounceEvent;

	public class Ball extends MovieClip {
		private var randomXspeed:RandomNumber;
		private var randomYspeed:RandomNumber;
		private var randomAlpha:RandomNumber;
		
		private var dirX:int =1;
		private var dirY:int =1;
		
		private var leftLimit:int;
		private var rightLimit:int;
		private var topLimit:int;
		private var bottomLimit:int;
		
		private var timeClock:Timer;
		
		public function Ball()  {
			randomXspeed = new RandomNumber(1,5);
			randomYspeed = new RandomNumber(10,50);
			randomAlpha = new RandomNumber(7,10);
			timeClock = new Timer(10,0);
			
			this.alpha = randomAlpha.getRandom()/10;
			
			//addEventListener(Event.ENTER_FRAME, moveBall);
			timeClock.addEventListener(TimerEvent.TIMER,moveBall);
			timeClock.start();
			addEventListener(BounceEvent.BOUNCE,onBounce);
			
			
			leftLimit = stage.stageWidth-this.width/2;
			rightLimit = this.width/2;
			topLimit = this.height/2;
			bottomLimit = stage.stageHeight-this.height/2;
			
			//trace(myRandom.getRandom());
		}
		
			public function moveBall(evt:Event):void {
				/*trace("move!"+this.x );*/
				
				if (this.x >=leftLimit) {
					this.x = leftLimit;
					
					dispatchEvent(new BounceEvent(BounceEvent.BOUNCE, "left"));
				} else if (this.x <= rightLimit) {
					this.x = rightLimit;
					dispatchEvent(new BounceEvent(BounceEvent.BOUNCE, "right"));
				} 
				
					
				this.x += dirX*randomXspeed.getRandom();
				
				if (this.y >= bottomLimit) {
					this.y = bottomLimit;
					dispatchEvent(new BounceEvent(BounceEvent.BOUNCE, "bottom"));
				} else if (this.y <= topLimit) {
					this.y = topLimit;
					dispatchEvent(new BounceEvent(BounceEvent.BOUNCE, "top"));
				}
				
				this.y += dirY*randomYspeed.getRandom();
			 
			}
				
			public function onBounce(event:BounceEvent):void {
				//trace(event.side);
			switch((event as BounceEvent).side) {
					
					case "left":
						dirX *= -1;
						break;
						
					case "right":
						dirX *= -1;
						break;
						
					case "top":
						dirY *= -1;
						break;
					
					case "bottom":
						dirY *= -1;
						break;
				}
				//this.alpha = randomAlpha.getRandom()/10;
				this.scaleX= randomAlpha.getRandom()/10;
				this.scaleY = randomAlpha.getRandom()/10;
			}
			
			
			
	}
} 