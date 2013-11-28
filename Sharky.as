package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class Sharky extends MovieClip{

		private var keys:Object = {};
		public function Sharky() {

			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKey);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKey);
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private function removeEventListeners():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKey);
			stage.removeEventListener(KeyboardEvent.KEY_UP,onKey);
			removeEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		function onKey(e:KeyboardEvent):void {
			keys[e.keyCode] = e.type==KeyboardEvent.KEY_DOWN;
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
				if(dx * scaleX<0)
					scaleX = -scaleX;
				
				var area:MovieClip = MovieClip(parent).area;
				var nextarea:MovieClip = MovieClip(parent).nextarea;
				
				var limit:Rectangle = area.getRect(parent);
				if(dx<0 && x+dx<limit.left || dx>0 && x+dx>limit.right) {
					dx = 0;
				}
				if(dy<0 && y+dy<limit.top || dy>0 && y+dy>limit.bottom) {
					dy = 0;
				}
				if(dy) {
					var sx:Number = Math.pow(1.005,dy);
					scaleY *= sx;
					scaleX *= sx;
				}
				x += dx;
				y += dy;
				var nextareaLimit:Rectangle = nextarea.getRect(parent);
				var point:Point = localToGlobal(new Point(shark.shark.x,shark.shark.y));
				if(Math.abs(506.9-point.x)<1 && Math.abs(249.85-point.y)<1) {
					removeEventListeners();
					if(area)
						parent.removeChild(area);
					if(nextarea)
						parent.removeChild(nextarea);
					MovieClip(parent).play();
				}
			}
		}

	}
	
}
