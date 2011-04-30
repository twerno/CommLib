package pl.twerno.commLib.collections {
	
	import flash.utils.Dictionary;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import pl.twerno.commLib.core.disposable.DisposeHelper;
	import pl.twerno.commLib.core.disposable.IDisposable;
	import pl.twerno.commLib.helpers.ObjectHelper;
	
	public class AbstractMap extends Proxy implements IMap, IDisposable {
		private var _length:uint = 0;
	    private var _disposeObjects:Boolean;
		private var _isDisposed:Boolean = false;

		private var entriesByKey:Dictionary;
		private var entriesByIdx:Vector.<MapEntry>;

		public function get isEmpty():Boolean        {return _length == 0}
		public function get isDisposed():Boolean     {return _isDisposed}
		public function get disposeObjects():Boolean {return _disposeObjects}
		
		public function get length():uint {return _length}
		
		/**
		 * constructor
		 */ 
		public function AbstractMap(disposeObjects:Boolean = false) {
			super();
			_disposeObjects  = disposeObjects;
			
			entriesByKey = new Dictionary();
			entriesByIdx = new Vector.<MapEntry>();
		}

		/**
		 * IMap
		 */ 
		public function put(key:*, val:*):void {
			if (key == null) return;
			
			var o:Object = entriesByKey[key];
			if (o != null)
				o.val = val;
			else {
				var entry:MapEntry = new MapEntry(_disposeObjects);
				entry.key  = key;
				entry._val = val;
				
				entriesByKey[key] = entry;
				entriesByIdx.push(entry);
				_length++;
			}
		}

		public function get(key:*):* {
			var entry:Object = entriesByKey[key];
			if (entry)
				return entry._val;
			else
				return null;
		}

		public function keyAtIdx(idx:uint):* {
			if (idx < 0 || idx >= _length) return null;
			return entriesByIdx[idx].key;
		}
		
		public function valAtIdx(idx:uint):* {
			if (idx < 0 || idx >= _length) return null;
			return entriesByIdx[idx]._val;
		}

		public function entryAtIdx(idx:uint):Object {
			if (idx < 0 || idx >= _length) return null;
			var entry:MapEntry = entriesByIdx[idx];
			return {key:entry.key, val:entry._val};
		}

		public function contains(key:*):Boolean {
			return entriesByKey[key] != null;
		}
		
		public function remove(key:*):void {
			var entry:MapEntry = entriesByKey[key];
			if (entry == null) return;
			delete entriesByKey[entry.key];
			entriesByIdx.splice(locateIdxByEntry(entry), 1);
			if (_disposeObjects) entry.dispose();
			_length--;
		}

		public function removeByIdx(idx:uint):void {
			if (idx < 0 || idx >= _length) return;
			var entry:MapEntry = entriesByIdx[idx];
			delete entriesByKey[entry.key];
			entriesByIdx.splice(idx, 1);
			if (_disposeObjects) entry.dispose();
			_length--;
		}

		public function clear():void {
			for each (var entry:MapEntry in entriesByIdx) {
				delete entriesByKey[entry.key];
				if (_disposeObjects) entry.dispose();
			}
			entriesByIdx.splice(0, _length);
			_length = 0;
		}
		
		public function toString():String {
			return ObjectHelper.simpleToString(this);
		}
		
		public function toArray():Array {
			var result:Array = new Array(_length);
			var entry:MapEntry;
			for (var i:uint = 0; i < _length; i++)
				result[i] = {key:entriesByIdx[i].key, val:entriesByIdx[i]._val}
			return result;
		}

		/*
		* DISPOSABLE OBJECT
		*  
		*/ 		
		
		public final function dispose():void {
			if (!_isDisposed) {
				_isDisposed = true;
				doDispose();
				DisposeHelper.nullReferences(this);
			}
		}
		
		public function doDispose():void {
			clear();
			
			entriesByKey = null;
			entriesByIdx = null;
		}	

		override flash_proxy function getProperty(name:*):* {
			if (name is QName)
				return get(name.localName);
			else
				return get(name);
		}
		
		override flash_proxy function setProperty(name:*, val:*):void {	
			if (name is QName)
				put(name.localName, val);
			else
				put(name, val);
		}
		
		override flash_proxy function hasProperty(name:*):Boolean {
			if (name is QName)
				return contains(name.localName);
			else
				return contains(name);
		}
		
		
		/**
		 * Allows enumeration of the proxied object's properties by index 
		 * number to retrieve property names.
		 * 
		 */ 
		override flash_proxy function nextName(index:int):String {
			return entriesByIdx[index -1].key.toString();
		}
		
		
		/**
		 * Allows enumeration of the proxied object's properties by index number.
		 */ 
		override flash_proxy function nextNameIndex(index:int):int {
			return index < _length ? index + 1 : 0;
		}
		
		
		/**
		 * Allows enumeration of the proxied object's properties by index number to 
		 * retrieve property values.
		 */ 
		override flash_proxy function nextValue(index:int):* {
			return entriesByIdx[index -1]._val;
		}	
		
		/**
		 *  @private
		 *  Any methods that can't be found on this class shouldn't be called,
		 *  so return null
		 */
		override flash_proxy function callProperty(name:*, ... rest):* {
			return null;
		}
		
		private function locateIdxByEntry(entry:MapEntry):int {
			for (var i:uint; i < _length; i++)
				if (entriesByIdx[i] == entry)
					return i;
			return -1;
		}
	}
}