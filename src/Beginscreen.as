package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Main;
	import flash.system.fscommand;


	public class Beginscreen extends StartScreen
	{
		static public const START:String = "start";
		//public static const START : String = "start";
		
		public function Beginscreen() 
		{
			startBtn.addEventListener  (MouseEvent.CLICK, StartClick);
			highscoreBtn.addEventListener  (MouseEvent.CLICK, HighScoreClick);
			exitBtn.addEventListener  (MouseEvent.CLICK, ExitClick);
		}
		private function StartClick(e:MouseEvent):void 
		{
			
			dispatchEvent(new Event(START));
			trace(5);
		}
		private function HighScoreClick(e:MouseEvent):void 
		{

		}
		private function ExitClick(e:MouseEvent):void 
		{
			fscommand("quit");
		}
	}
}