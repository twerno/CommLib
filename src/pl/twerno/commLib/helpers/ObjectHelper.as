package pl.twerno.commLib.helpers {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class ObjectHelper {
	
		public static function getClassName(o:Object):String {
			if (!o) return null;
			return getQualifiedClassName(o).replace("::", ".");
		}
		
		public static function getClass(o:Object):Class {
			if (!o) return null;
			if (o is Class)
				return o as Class;
			else
				return getDefinitionByName(getQualifiedClassName(o)) as Class;
		}

		public static function getObjectName(o:Object):String {
			if (!o) return 'null';
			var result:String = getQualifiedClassName(o);
			return result.substring(result.indexOf('::') +2);
		}
		
		public static function simpleToString(o:Object):String {
			if (o is Class)
				return '[class '  +getObjectName(o) +']';
			else
				return '[object ' +getObjectName(o) +']';
		}
	}
}