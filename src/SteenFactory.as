package 
{
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class SteenFactory extends meteoor
	{
		public var windX:Number;
		public var gravityY:Number;
		public static var _allMeteooren:Array = [];

		public function Steen() 
		{
			_allMeteooren.push(this);
		}
		public function update():void
		{
			
			x -= windX 	  * Math.random() * Math.random() + 10 * Math.random() * Math.random() * Math.random() * Math.random() + 10 * Math.random() * 100;
			y -= gravityY * 1;
		}
		
		
	}

}