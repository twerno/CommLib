package pl.twerno.commLib.core.disposable {
	import flash.events.IEventDispatcher;
	
	import spark.components.Group;
	
	public class DisposableGroup extends Group implements IDisposable {
		
		private var _isDisposed:Boolean = false;
		
		public function get isDisposed():Boolean {return _isDisposed}	

		public function DisposableGroup() {
			
		}		
		
		public function dispose():void {
			if (!_isDisposed) {
				_isDisposed = true;
				doDispose();
				DisposeHelper.nullReferences(this);
			}
		}

		public function doDispose():void {
			/* virtual */
		}
		

	}
}