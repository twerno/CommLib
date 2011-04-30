package pl.twerno.commLib.core.disposable {	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class DisposableEventDispatcher extends EventDispatcher implements IDisposable {
		
		private var _isDisposed:Boolean = false;
		
		public function get isDisposed():Boolean {return _isDisposed}			

		
		public function DisposableEventDispatcher(target:IEventDispatcher=null) {
			super(target);
		}

		public final function dispose():void {
			if (!_isDisposed) {
				_isDisposed = true;
				doDispose();
				DisposeHelper.nullReferences(this);
			}
		}

		public function doDispose():void {
		}
		
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void {
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public override function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void {
			super.removeEventListener(type, listener, useCapture);
		}		
	}
}