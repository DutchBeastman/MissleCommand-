package  
{
	/**
	 * ...
	 * @author Fabian Verkuijlen
	 */
	public class CarFactory 
	{
		
		public function MakeCar(Type : int) : Cars
		{
			var car : Cars;
			
			if (Type < 10)
			{	
				car = new Ford;
				
			}
			else if (Type > 10)
			{
				car = new Ferrari;
				
			}
			return car;
		}
		
	}

}