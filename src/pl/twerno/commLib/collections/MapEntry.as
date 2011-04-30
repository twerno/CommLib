package pl.twerno.commLib.collections {
	import pl.twerno.commLib.core.disposable.Disposable;
	import pl.twerno.commLib.core.disposable.DisposeHelper;
	
	internal final class MapEntry extends Disposable {
		private var _ownsObject:Boolean;
		internal var _val:Object;
		
		public var key:Object;

		public function get val():Object {return _val}
		public function set val(o:Object):void {
			if (_val != null && _ownsObject)
				DisposeHelper.disposeObj(_val);
			_val = o;
		}
		
		public function MapEntry(ownsObject:Boolean = false) {
			super();
			_ownsObject = ownsObject;
		}
		
		public override function doDispose():void {
			key = null;
			val = null;
			super.doDispose();
		}
	}
}