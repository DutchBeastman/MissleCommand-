package 
{
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
/**
* ...
* @author Fabian Verkuijlen
*/
	public class Bullet extends bullet
	{
	public static var _allBullets:Array = [];
	private var _angle : Number;
	public var movex : Number;
	public var movey : Number;
	public function Bullet() 
		{
			_allBullets.push(this);
			
		}
		
		
		
		public function update():void
		{
			x -= movex * 3;
			y -= movey * 3;
		}
		
		public function get angle():Number 
		{
			return _angle;
		}
		
		public function set angle(value:Number):void 
		{
			_angle = value;
			movex = Math.cos(value) * 5;
			movey = Math.sin(value) * 5;
		}
	}

}
