package pl.twerno.commLib.helpers {
	import flash.utils.getQualifiedClassName;
	
	public class ErrorMsg {
		
		public static function getMsg(object:Object, msg:String):String {
			return ObjectHelper.getClassName(object) +': ' +msg;
		}
	}
}