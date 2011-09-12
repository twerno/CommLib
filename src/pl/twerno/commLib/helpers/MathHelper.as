package pl.twerno.commLib.helpers {
	 
	public class MathHelper {
		/**
		 *  Zwraca losową liczbę całkowitą z przedziału [0.. max -1]
		 * 
		 *  @param max Maksymalna wartość.
		 *  @return liczba całkowita z przedziału [0..max -1]
		 */ 
		public static function nextInt(max:int):int {
			return Math.floor(Math.random()*max);
		}
		
		/**
		 *  Zwraca losową liczbę rzeczywistą z przedziału [0.. max)
		 * 
		 *  @param max Maksymalna wartość.
		 *  @return liczba rzeczywistą z przedziału [0..max)
		 */ 
		public static function nextDouble(max:Number):Number {
			return Math.random()*max;
		}
	}
}