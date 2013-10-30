package 
{
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
/**
* ...
* @author Fabian Verkuijlen
*/
public class Tower extends wholeCannon
	{
	public static var _allTowers:Array = [];
	
	public function Tower() 
		{
		_allTowers.push(this);

		addEventListener(Event.ENTER_FRAME, loop);
		}

	private function loop(e:Event):void 
		{
		var cx:Number = mouseX - cannonloop.x;
		var cy:Number = mouseY - cannonloop.y;

		
		var Radians:Number = Math.atan2(cy, cx); 

		
		var Degrees:Number = Radians * 180 / Math.PI;

		cannonloop.rotation = Degrees+90;
		}

	}

}