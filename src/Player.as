package  
{
	import flash.net.SharedObject;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Adam Kay
	 */
	public class Player extends Entity
	{
		private const SPEED:Number = 100;
		private const COOLDOWN:Number = .4;
		private var shootTimer:Number = 0;
		private var numShot:Number = 0;
		
		public function Player() 
		{
			super(20, FP.halfHeight, Image.createRect(20, 10, 0xFF0000));
			setHitbox(20, 10);
			type = "player";
		}
		
		override public function update():void
		{
			if (shootTimer > 0) {
				shootTimer -= FP.elapsed;
			}
			
			if (Input.check(Key.W)) y -= SPEED * FP.elapsed;
			if (Input.check(Key.A)) x -= SPEED * FP.elapsed;
			if (Input.check(Key.S)) y += SPEED * FP.elapsed;
			if (Input.check(Key.D)) x += SPEED * FP.elapsed;
			if (Input.check(Key.SPACE) && shootTimer <= 0) fire();
		}
		
		public function fire():void
		{
			shootTimer += COOLDOWN;
			numShot++;
			
			FP.world.add(new Shot(x + 20, y + 3));
			FP.world.add(new Shot(x + 20, y + 7));
		}
		
	}

}