package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class Ford extends Cars
	{
		private var ford : FordMC = new FordMC;
		public function Ford() 
		{
			addChild(ford);
			ford.x = 200;
			ford.y = 650;
			ford.z = -40;
			
			addEventListener(Event.ENTER_FRAME, loop)
			
		}
		
		private function loop(e:Event):void 
		{
			ford.x += 12 + Math.random() * 3;
			
			if (ford.x >= 1400)
			{
				ford.x -= 2800;
			}
		}
		
	}

}