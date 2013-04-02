package {
	import flash.display.Stage;	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.LoaderInfo;	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	
	//import flash.text.TextField;
	
	public class FlashAudio extends MovieClip {
		
		//Define and instantiate the audio source
		//private var audioLocation:String = "Alien_Po-bdog-7943_hifi.mp3";
		
		private var audioLocation:String;
		
		//private var audioLocation:String = "Steinhau-Kim_Stei-830_hifi.mp3";
		//audioLocation = getFlashVarsObj().audioFile;
		
		//Define and instantiate a URL request object
		private var URLReq:URLRequest;
		//URLReq = new URLRequest(audioLocation);
		
		//Define and instantiate a sound object
		private var snd:Sound
		//snd = new Sound();		
		
		//Define and instantiate a sound channel object
		private var soundChannelVar:SoundChannel = new SoundChannel();
		//soundChannelVar = new SoundChannel();
		
		//Define and instantiate a sound transform object
		private var stVolume:SoundTransform;
		
		//stVolume = new SoundTransform();

		
		
		
		// Timerloading
		//private var timerLoading:Timer;
		
		// Play
		
		private var btnPlayState:Boolean; 
		private var btnPlayObj:btnPlay = new btnPlay();
		private var btnPauseObj:btnPause = new btnPause();
		private var btnStopObj:btnStop = new btnStop();
		
		//public var playContainer:MovieClip = new MovieClip();
		
		
		// Mute
		private var volumeLevel:Number;
		private var btnMuteState:Boolean;
		private var btnMuteObj:btnMute = new btnMute();
		private var btnUnMuteObj:btnUnMute = new btnUnMute();
		
		
		// Textfields
		
		private var txtStatus:TextField = new TextField();
		private var txtTrackPosition:TextField = new TextField();
		private var txtTrackLength:TextField = new TextField();
		//private var txtHeaderText:TextField = new TextField();
		private var mediaTextFont:FontArial = new FontArial();
		//private var mediaHeaderTextFont:FontArialRoundedMTBold = new FontArialRoundedMTBold();
		private var mediaTextFormat:TextFormat = new TextFormat(); 
		//private var mediaHeaderTextFormat:TextFormat = new TextFormat(); 
	
		// Loader Bar
		
		private var timerLoading:Timer;
		private var byteLoaded:int;
		private var byteTotal:int;
		
		// Playhead
		private var timerPlayHead:Timer;		
		private var playHeadPosition:Number = 0;
		private var trueLength:Number;
		private var multiplier: Number;
		private var barWidth: Number;
		//private var scrubPosition:scrubPosition = new scrubPosition();
		
		private const VOLUME = 1;
			
		public function FlashAudio(){
			//stop();

			
						
			btnPlayState = true;
			btnPlayObj.x = 18;
			btnPlayObj.y = 20;
			btnPlayObj.visible = true;
			
			stage.addChild(btnPlayObj);
			
			btnStopObj.x = 55;
			btnStopObj.y = 20;
			btnStopObj.visible = true;
			stage.addChild(btnStopObj);		
			
			btnPauseObj.x = 18;
			btnPauseObj.y = 20;			
			btnPauseObj.visible = false;
			
			//stage.addChild(playContainer);
			stage.addChild(btnPauseObj);

			btnMuteState = true;
			btnMuteObj.x = 289.0;
			btnMuteObj.y = 20;
			btnMuteObj.visible = true;
			
			stage.addChild(btnMuteObj);
			
			btnUnMuteObj.x = 289.0;
			btnUnMuteObj.y = 20;
			btnUnMuteObj.visible = false;
			
			

			//stage.addChild(muteContainer);
			stage.addChild(btnUnMuteObj);
			
			mediaTextFormat.color = 0xffffff; 
			mediaTextFormat.size = 14;
			mediaTextFormat.font = mediaTextFont.fontName;
			mediaTextFormat.align = TextFormatAlign.CENTER;	
			
/*			mediaHeaderTextFormat.color = 0xffffff; 
			mediaHeaderTextFormat.size = 24;
			mediaHeaderTextFormat.font = mediaHeaderTextFont.fontName;
			mediaHeaderTextFormat.align = TextFormatAlign.CENTER;	*/

			txtStatus.defaultTextFormat = mediaTextFormat;	
			txtTrackPosition.defaultTextFormat = mediaTextFormat;	
			txtTrackLength.defaultTextFormat = mediaTextFormat;

			//txtHeaderText.defaultTextFormat = mediaHeaderTextFormat;



			txtStatus.x = 60;
			txtStatus.y = 9;
			//txtStatus.width = 100;
			txtStatus.height = 30;			
			txtStatus.text = '...';

			txtTrackPosition.x = 125;
			txtTrackPosition.y = 9;
			txtTrackPosition.width = 125;
			txtTrackPosition.height = 30;		
			
			txtTrackLength.x = 170;
			txtTrackLength.y = 9;
			txtTrackLength.width = 125;
			txtTrackLength.height = 30;	
			txtTrackLength.textColor = 0x000000;
			
/*			txtHeaderText.x = 12.5;
			txtHeaderText.y = 7;
			txtHeaderText.width = 335;
			txtHeaderText.multiline = true;
			txtHeaderText.wordWrap=true;*/

			//txtHeaderText.height = 30;		


			txtTrackPosition.text = '00:00';
			txtTrackLength.text = '00:00';
			
			//txtHeaderText.text = getFlashVarsObj().headerText || "Media Player";

			addChild(txtStatus);
			addChild(txtTrackPosition);
			addChild(txtTrackLength);
			//addChild(txtHeaderText);

			
			snd = new Sound();	
			soundChannelVar = new SoundChannel();
			stVolume = new SoundTransform();	
			//config={"audioFile":"Steinhau-Kim_Stei-830_hifi.mp3"}
			audioLocation = getFlashVarsObj().audioURL;
			
			if (audioLocation) {
			URLReq = new URLRequest(audioLocation);			
			snd.load(URLReq);
			} else {
				txtStatus.text = 'Error: No audio file found.';
			}
			
			volumeLevel = VOLUME;
			movScrubber.alpha = 0.3;
			barWidth = movScrubber.width;
			movScrubber.scrubPosition.width = 0;			
			
			timerLoading = new Timer(100,0);
			timerLoading.addEventListener(TimerEvent.TIMER, onLoading);
			timerLoading.start();	
			
			timerPlayHead = new Timer(100,0);
			timerPlayHead.addEventListener(TimerEvent.TIMER, this.headPosition);

			
			
			btnPlayObj.addEventListener(MouseEvent.CLICK, btnPlayClick);
			btnStopObj.addEventListener(MouseEvent.CLICK, btnStopClick);
			btnPauseObj.addEventListener(MouseEvent.CLICK, btnPlayClick);
			btnMuteObj.addEventListener(MouseEvent.CLICK, btnMuteClick);
			btnUnMuteObj.addEventListener(MouseEvent.CLICK, btnMuteClick);
			
		}

	
		public function onLoading(evt:TimerEvent):void {
			
			byteLoaded = snd.bytesLoaded;
			byteTotal =snd.bytesTotal;
			trace('loading...');
			if ((byteTotal >= byteLoaded)&&(byteLoaded>0)) {
				if(txtStatus.text == '...') {
					txtStatus.text = "Loading...";
				}
				
				movScrubber.movLoaderBar.scaleX = (1-(byteLoaded/byteTotal)); //*barWidth;
				
				
				if (byteLoaded == byteTotal) {
					
					if(txtStatus.text == "Loading...") {
						multiplier = (1/(snd.bytesLoaded/snd.bytesTotal));
						trueLength = snd.length*multiplier;
						//trace ('true length: '+ trueLength);
						txtStatus.text = "Ready...";
						txtTrackPosition.text = "00:00";
						txtTrackLength.text =timeFormat(trueLength);
						//timerPlayHead.start();
					}
					
					timerLoading.stop();
				}
			}
		}

		function headPosition(evt:TimerEvent):void {
			
			movScrubber.scrubPosition.width = Math.floor((soundChannelVar.position/trueLength)*barWidth); //*originalWidth
			//trace ('sound length: '+ soundChannelVar.position);
			
			txtTrackPosition.text = timeFormat(soundChannelVar.position);
																					   
		}
		
		// toggle play/pause state
		public function btnPlayClick(evt:MouseEvent): void {

			if (btnPlayState) {
				playSound();
			} else  {
				pauseSound();
			}
			soundChannelVar.addEventListener(Event.SOUND_COMPLETE, soundComplete);
		}		
		
		// Toggle mute/unmute state
		public function btnMuteClick(evt:MouseEvent): void {
			
			trace("mouse click (mute): "+ btnMuteState);
			if (btnMuteState) {
				muteSound();

			} else  {
				unMuteSound();
			}
				stVolume.volume = volumeLevel;
				soundChannelVar.soundTransform = stVolume;
		}
		
		// Reset play/pause button state, playhead position, and scrubber.
		public function soundComplete(evt:Event):void {
			playHeadPosition = 0;
			btnPlayObj.visible = true;
			btnPauseObj.visible = false;
			btnPlayState = true;	
			movScrubber.scrubPosition.width = barWidth;
			timerPlayHead.stop();
			txtStatus.text = "";
			//trace('sound complete...');
	
		}	
		
		
		// Load external variables from flashVars	
		public function getFlashVarsObj( ):Object {
		
			var objFlashVars : Object;
			objFlashVars = LoaderInfo ( this.loaderInfo ).parameters;
			
			return objFlashVars;
		}		
		
		// Play sound
		public function playSound():void {
			soundChannelVar = snd.play(playHeadPosition,1);
			timerPlayHead.start();
			stVolume.volume = volumeLevel;
			soundChannelVar.soundTransform = stVolume;
			txtStatus.text = "Playing...";
			//trace('sound playing...');
				btnPlayObj.visible = false;
				btnPauseObj.visible = true;		
				btnPlayState = false;
		}
		
		public function btnStopClick(evt:MouseEvent):void {
			playHeadPosition = 0;
			soundChannelVar.stop();
			btnPlayObj.visible = true;
			btnPauseObj.visible = false;
			btnPlayState = true;		
			txtStatus.text = "Stopped...";		
			txtTrackPosition.text = "00:00";
		}
		
		// Pause sound and get playhead position
		public function pauseSound():void {
			
			playHeadPosition = soundChannelVar.position;
			soundChannelVar.stop();
			timerPlayHead.stop();
			
			txtStatus.text = "Paused...";
			//trace('sound pause...');
			
			btnPlayObj.visible = true;
			btnPauseObj.visible = false;
			btnPlayState = true;
			
		}

		// Mute sound
		public function muteSound():void {
				volumeLevel = 0;
				btnMuteObj.visible = false;
				btnUnMuteObj.visible = true;
				btnMuteState = false;
				txtStatus.text = "Mute...";			
		}
		
		// Unmute sound
		public function unMuteSound():void {
				volumeLevel = VOLUME;
				btnMuteObj.visible = true;
				btnUnMuteObj.visible = false;
				btnMuteState = true;
				txtStatus.text = "";			
		}
		
		
		// Convert time format from milliseconds to minutes/seconds (mm:ss)
		public function timeFormat(msecs:Number):String {
			
			var txtOutput:String;
			var strMin:String;
			var strSec:String;
			
			//Convert milliseconds into minutes & seconds
			var minutes = Math.floor((msecs/1000)/60);
			
			if (minutes <1) {
				minutes = 0;
				strMin =  "0"+minutes.toString();
			} else {
				strMin =  minutes.toString();
			}
			
			
			var seconds = Math.floor((msecs/1000)%60);
			
			if (seconds < 10) {
				strSec = "0"+seconds.toString();
				
			} else {
				strSec = seconds.toString();
			}
			
			
			txtOutput = strMin+":"+strSec;
			
			return txtOutput;
		}
		
	}

}