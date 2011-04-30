package pl.twerno.commLib.core.disposable {
	public interface IDisposable {
		
		/**
		 *  Metoda dispose usuwa wszystkie referencje, ktore trzyma obiekt
		 *    umożliwiając GarbageCollector zwolnienie obiektów.
		 *    W szczególności powinna wyrejestrowywać eventy.
		 * 
		 */ 
		function dispose():void;
		
		/**
		 * 
		 */
		function doDispose():void;
		
		/**
		 * Zapobiega zakleszczeniu.
		 * 
		 */		
		function get isDisposed():Boolean;
	}
}