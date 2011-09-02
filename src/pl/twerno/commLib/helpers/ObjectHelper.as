package pl.twerno.commLib.helpers {
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import mx.collections.ArrayCollection;

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

		public static function fillFromObject(source:Object, destiny:Object):void {
			for (var key:String in destiny)
				destiny[key] = source[key];
		}

		public static function detailedToString(object:Object, 
												showClassInfo  : Boolean = true,
												showVariables  : Boolean = true,
												showProperties : Boolean = true,
												showMethods    : Boolean = true,
												showPropTypes  : Boolean = true,
												showHeader     : Boolean = true):String {
			var classInfo:XML = describeType(object);
			var result:String = '';

			if (showClassInfo)
				result = "[class " +classInfo.@name.toString() + "]\n";

			// List the object's variables, their values, and their types.
			if (showVariables)
				for each (var v:XML in classInfo..variable) {
					result += (showHeader) ? "[Var] " : "";
					result += v.@name;
					result += (showPropTypes) ? ":"+v.@type : "";
					result += collectionToString(object[v.@name]);
					result += "\n";
				}

			// List accessors as properties.
			if (showProperties)
				for each (var a:XML in classInfo..accessor) {
					// Do not get the property value if it is write only.
					if (a.@access == 'writeonly') {
						result += (showHeader) ? "[Property] " : "";
						result += a.@name;
						result += (showPropTypes) ? ":"+a.@type : "";
						result += "\n";
					} else {
						result += (showHeader) ? "[Property] " : "";
						result += a.@name;
						result += (showPropTypes) ? ":"+a.@type : "";
						result += collectionToString(object[a.@name]);
						result += "\n";
					}
				}

			// List the object's methods.
			if (showMethods)
				for each (var m:XML in classInfo..method) {
					result += (showHeader) ? "[Method] " : "";
					result += m.@name +"():" +m.@returnType +"\n";
				}

			return result;
		}

		public static function collectionToString(collection:Object):String {
			var result: String = '';

			if (collection is Array)
				result += "=[" +(collection as Array).join(', ') +"]";
			else if (collection is ArrayCollection)
				result += "=[" +(collection as ArrayCollection).source.join(', ') +"]";
			else
				result += "=" + collection.toString();

			return result;
		}
	}
}