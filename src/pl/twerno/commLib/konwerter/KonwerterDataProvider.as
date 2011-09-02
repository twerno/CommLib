package pl.twerno.commLib.konwerter {
	import mx.collections.ArrayCollection;

	public class KonwerterDataProvider extends ArrayCollection {

		public function KonwerterDataProvider(...objects) {
			super(null);

			for each (var obj:Object in objects)
				addItem(new KonwerterItem(obj['label'], obj['val']));	
		}

		public override function addItem(item:Object):void {
			var newItem:KonwerterItem = new KonwerterItem(item['label'], item['val']);
			for each (var o:KonwerterItem in this) {
				if (o.label == newItem.label)
					throw new Error("Istnieje element o label:" +newItem.label);
				
				if (o.val == newItem.val)
					throw new Error("Istnieje element o val:" +newItem.val);
			}
			super.addItem(newItem);
		}

		public function val2Label(val:String):String {
			if (val == null) return '';
			
			for each (var item:KonwerterItem in this)
				if (item.val == val)
					return item.label;

			throw new Error('Nie znaleziono elementu o val:' +val);	
		}
		
		public function label2Val(label:String):String {
			if (label == null) return '';
			
			for each (var item:KonwerterItem in this)
			if (item.label == label)
				return item.val;
			
			throw new Error('Nie znaleziono elementu o label:' +label);			
		}
		
		public function itemByVal(val:String):KonwerterItem {
			for each (var item:KonwerterItem in this)
				if (item.val == val)
					return item;
			return null;
		}
		
		public function itemByLabel(label:String):KonwerterItem {
			for each (var item:KonwerterItem in this)
			if (item.label == label)
				return item;
			return null;
		}
	}
}