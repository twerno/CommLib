package pl.twerno.commLib.helpers {
	public class StringHelper {
		/**
		 *  Testuje zmienną typu string.
		 *  
		 *  @param s Testowana zmienna.
		 *  @return <code>true</code> jeśli string jest pusty, lub jest równy null.<br/>
		 *  <code>false</code> w przeciwnym przypadku.
		 */
		public static function isEmpty(s:String):Boolean {
			if (s == null || s == '') 
				return true;
			else
				return false;
		}


		/**
		 *  Wypełnia wyróżnione miejsca w łańcuchu tekstowym kolejnymi elementami z tablicy parametrów.
		 *  
		 *  @param source Łańcuch tekstowy zawierający znaki {x}, gdzie x jest kolejną liczbą z przedziału [0..n]
		 *  @param params Tablica zawierająca n parametrów kolejno wstawianych w wyróżnione miejsca w łańcuchu tekstowym.
		 *  @return Wypełniony łańcuch tekstowy.
		 */
		public static function format(source:String, params:Array):String {
			if (params)
				for (var i:int = 0; i < params.length; i++)
					source = source.replace(new RegExp("\\{"+i+"\\}", "g"), params[i].toString());
			return source;
		}
	}
}