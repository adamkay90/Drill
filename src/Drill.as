package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Adam Kay
	 */
	public class Drill extends Entity
	{
		[Embed(source = 'drill.png')] private const DRILL:Class;
		private const FLOAT_SPEED:Number = 100;
		private var isAttached:Boolean = false;
		
		public function Drill() 
		{
			super(FP.width - 50, FP.halfHeight); 
			graphic = new Image(DRILL);
			setHitbox(17, 17);
			type = "drill";
			this.mask = new Pixelmask(DRILL);
		}
		
		override public function update():void
		{
			if (this.world != null) {
				if (this.x < -30) 
				{
					FP.world.remove(this);
					GameWorld.isDrill = false;
				}
				if (isAttached == false && this.collide("player", x, y))
					isAttached = true;
				if (isAttached)
				{
					// This looks kind of junky, should probably just set its location once
					// And then use the player's speed to update it
					x = FP.world.classFirst(Player).x + 20;
					y = FP.world.classFirst(Player).y - 5;
				}
				else {
					x -= FLOAT_SPEED * FP.elapsed;
				}
			}
			
		}
		
	}

}