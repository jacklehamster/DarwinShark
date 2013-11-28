package  {
	
	public class MusicStop extends Element {
		
		static public const STOP:String = "STOP";
		static public const EPIC:String = "EPIC";
		static public const ANGEL:String = "ANGEL";
		static public const DEEP:String = "DEEP";
		static public const ARCADE:String = "ARCADE";
		static public const FIRST:String = "FIRST";
		static public const BIRD:String = "BIRD";
		static public const RELEASE:String = "RELEASE";
		static public const ZAP:String = "ZAP";
		static public const BOOM:String = "BOOM";

		static private _instance:MusicStop = new MusicStop();
		
		public function MusicStop() {
		}

		static public function playSong(id:String):void {
			_instance.gotoAndStop(id);
		}
	}
	
}
