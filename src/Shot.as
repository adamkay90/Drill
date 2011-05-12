package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Adam Kay
	 */
	public class Shot extends Entity
	{
		private const SPEED:Number = 400;
		private var image:Image;
		
		public function Shot(x:Number, y:Number) 
		{
			image = Image.createRect(8, 2);
			super(x, y, image);
		}
		
		override public function update():void
		{
			if (x < FP.screen.width + 2) {
				x += SPEED * FP.elapsed;
			}
			else {
				destroy();
			}
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}