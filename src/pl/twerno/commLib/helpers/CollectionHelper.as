package pl.twerno.commLib.helpers {
	import mx.collections.ArrayCollection;

	public class CollectionHelper {
	
		public static function arayCollectionContains(arrayCollection:ArrayCollection, propertyName: String, val:Object):Boolean {
			for each (var o:Object in arrayCollection)
				if (o.hasOwnProperty(propertyName) && o[propertyName] == val)
					return true;
			return false;
		}
	}
}