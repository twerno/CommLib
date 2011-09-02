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
			return (s == null || s == '');
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

		public static function arrayToStr(array:Array):String {
			var result:String = '';
			for (var o:Object in array)
				if (result == '')
					result = o.toString()
				else
					result += ', ' +o.toString()
			return '[' +result +']';
		}

		public static function getErrorMsg(object:Object, msg:String, params:Array = null):String {
			return '[' +ObjectHelper.getClassName(object) +']' 
				  +' ' +format(msg, params);
		}
	}
}