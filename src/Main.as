package 
{
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Adam Kay
	 */
	public class Main extends Engine
	{
		private var grid:Array;
		
		public function Main()
		{
			super(400, 300, 60, false);
			FP.world = new GameWorld();
			FP.console.enable();
			FP.screen.scale = 2;
		}
		
		override public function init():void
		{

		}
		
	}

}