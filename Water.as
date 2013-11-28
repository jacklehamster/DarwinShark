package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Water extends MovieClip {

		public function Water() {
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private function onFrame(e:Event):void {
			var p:MovieClip = MovieClip(parent);
			if(!p || !p.shark)
				removeEventListener(Event.ENTER_FRAME,onFrame);
			else {
				x = p.shark.x;
				y = p.shark.y;
				scaleX = p.shark.scaleX;
				scaleY = p.shark.scaleY;
			}
		}

	}
	
}
