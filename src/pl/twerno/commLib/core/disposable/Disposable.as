package pl.twerno.commLib.core.disposable {

	public class Disposable implements IDisposable {
		
		private var _isDisposed:Boolean = false;

		public function get isDisposed():Boolean {return _isDisposed}		

		public final function dispose():void {
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