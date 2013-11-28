package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	
	public class Sharkycopy extends MovieClip {

		private var keys:Object = {}, movX:Number = 0, movY:Number = 0;
		public function Sharkycopy() {

			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKey);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKey);
			addEventListener(Event.ENTER_FRAME,onFrame);
			updateScale();
		}
		
		private function updateScale():void {
			scaleY = Math.sqrt(y)/50;
			scaleX = (scaleX<0 ? -1 : 1 ) * Math.abs(scaleY);
		}
		
		private function removeEventListeners():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKey);
			stage.removeEventListener(KeyboardEvent.KEY_UP,onKey);
			removeEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		function onKey(e:KeyboardEvent):void {
			keys[e.keyCode] = e.type==KeyboardEvent.KEY_DOWN;
		}
		
		public function standUp():void {
			gotoAndStop("WALK");
		}

		function onFrame(e:Event):void {
			if(!stage) {
				removeEventListeners();
			}
			else {
				var dx:Number = 0, dy:Number = 0;
				if(keys[Keyboard.UP]) {
					dy--;
				}
				if(keys[Keyboard.DOWN]) {
					dy++;
				}
				if(keys[Keyboard.RIGHT]) {
					dx++;
				}
				if(keys[Keyboard.LEFT]) {
					dx--;
				}
				
				if(!dx && movX && currentFrame!=1)
					dx = movX;
				if(!dy && movY && currentFrame!=1)
					dy = movY;
				
				
				if(dx * scaleX<0)
					scaleX = -scaleX;
				
				if(dy) {
//					var sx:Number = Math.pow(1.005,dy);
//					scaleY *= sx;
//					scaleX *= sx;
				}
				if(currentLabel!="JUMP" || jumpshark.currentFrame>=7) {
					x += dx*(currentLabel=="WALK"?10:15)*Math.abs(scaleX);
					y += dy*(currentLabel=="WALK"?10:15)*Math.abs(scaleY);
				}
				updateScale();
				
				if(currentLabel=="JUMP") {
					
				}
				else if(keys[Keyboard.SPACE]) {
					gotoAndStop("JUMP");
					jumpshark.play();
				}
				else {
					
					if(dx || dy) {
						movX = dx;
						movY = dy;
						if(currentLabel!="WALK") {
							gotoAndStop("WALK");
						}
						walkshark.play();
					}
					else {
						gotoAndStop("WALK");
						walkshark.gotoAndStop(1);
					}
				}
			}
		}
	}
	
}
