package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Adam Kay
	 */
	public class GameWorld extends World
	{
		public static var isDrill:Boolean = false;
		
		public function GameWorld() 
		{
			add(new Player());
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.Z) && !isDrill) 
			{
				FP.world.add(new Drill());
				isDrill = true;
			}
		}
		
	}

}