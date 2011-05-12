package 
{

	/**
	 * ...
	 * @author Adam Kay
	 */
	public class Helper 
	{
		
		public function Helper() 
		{
			
		}
		
		// Returns true if [x1, y1] is next to [x2, y2] in the hexagonal grid
		public static function isNextTo(x1:int, y1:int, x2:int, y2:int): Boolean
		{
			if (x1 >= 0 && y1 >= 0 && x2 >= 0 && y2 >= 0) {
				if (x1 - 1 == x2) {
					if (y1 == y2) return true;
				}
				if (x1 == x2) {
					if (y1 - 1 == y2) return true;
					if (y1 + 1 == y2) return true;
				}
				if (x1 + 1 == x2) {
					if (y1 - 1 == y2) return true;
					if (y1 == y2) return true;
					if (y1 + 1 == y2) return true;
				}
			}
			return false;
		}
		
		// Returns an array of the six spaces surrounding a hex. Starts from the space directly to the left of a hex, and goes clockwise.
		// Note when making hex grids... always make them squares.
		public static function getAdjacentHex(grid:Array, x:int, y:int): Array
		{
			if (x >= 0 && y >= 0 && x < grid.length) {
				var list:Array = new Array(6);
				
				if (x - 1 < 0 || grid[x -1][y] == null) list[0] = 0;
				else list[0] = grid[x - 1][y];
				
				if (y - 1 < 0 || grid[x][y - 1] == null) list[1] = 0;
				else list[1] = grid[x][y - 1];
				
				if (x + 1 >= grid.length || y - 1 < 0 || grid[x + 1][y - 1] == null) list[2] = 0;
				else list[2] = grid[x + 1][y - 1];
				
				if (x + 1 >= grid.length || grid[x + 1][y] == null) list[3] = 0;
				else list[3] = grid[x + 1][y];
				
				if (x + 1 >= grid.length || y + 1 >= grid.length || grid[x + 1][y + 1] == null ) list[4] = 0;
				else list[4] = grid[x + 1][y + 1];
				
				if (y + 1 >= grid.length || grid[x][y + 1] == null) list[5] = 0;
				else list[5] = grid[x][y + 1];
				
				return list;
			} else return null;
		}
		
	}

}