package pl.twerno.commLib.core.disposable {
	import flash.utils.Dictionary;
	
//	import mx.collections.ArrayCollection;

	public class DisposeHelper {
		
		public static function disposeDict(dict:Dictionary, ownsObjects:Boolean = false):void {
			if (!dict) return;
			
			for (var key:String in dict) {
				if (ownsObjects)
					disposeObj(dict[key]);

				delete dict[key];
			}
		}

//		public static function disposeCollection(collection: ArrayCollection, ownsObjects:Boolean = false):void {
//			if (!collection) return;
//
//			collection.disableAutoUpdate();
//			
//			if (ownsObjects)
//				for each (var o:Object in collection)
//					disposeObj(o);
//
//			collection.removeAll();
//			collection.enableAutoUpdate();
//		}

		public static function disposeObj(obj:Object):void {
			if (obj != null && obj is IDisposable) 
				(obj as IDisposable).dispose();
		}

		public static function nullReferences(obj:Object):void {
			for (var key:String in obj)
				obj[key] = null;
		}
	}
}