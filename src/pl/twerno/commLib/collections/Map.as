package pl.twerno.commLib.collections {
	import pl.twerno.commLib.helpers.ObjectHelper;
	import pl.twerno.commLib.helpers.StringHelper;
	
	public class Map extends AbstractMap {
		private var _keyClass:Class;
		private var _valClass:Class;
		private var _checkKey:Boolean;
		private var _checkVal:Boolean;
		
		public function get keyClass():Class {return _keyClass}
		public function get valClass():Class {return _valClass}
		
		public function Map(disposeObjects:Boolean = false, keyClass:Object = null, valClass:Object = null) {
			super(disposeObjects);
			_keyClass = keyClass ? ObjectHelper.getClass(keyClass) : Object;
			_valClass = valClass ? ObjectHelper.getClass(valClass) : Object;
			_checkKey = _keyClass != Object;
			_checkVal = _valClass != Object;
		}

		public override function put(key:*, val:*):void {
			if (_checkKey && key != null && !(key is keyClass)) 
				throw new Error(StringHelper.format('Niezgodność typów oczekiwano {0} otrzymano {1}', [ObjectHelper.getClassName(keyClass), ObjectHelper.getClassName(key)]));
			if (_checkVal && val != null && !(val is valClass)) 
				throw new Error(StringHelper.format('Niezgodność typów oczekiwano {0} otrzymano {1}', [ObjectHelper.getClassName(valClass), ObjectHelper.getClassName(val)]));
			super.put(key, val);
		}
		
		public override function doDispose():void {
			_keyClass = null;
			_valClass = null;
			
			super.doDispose();
		}
	}
}