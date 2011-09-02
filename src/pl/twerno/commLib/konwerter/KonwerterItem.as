package pl.twerno.commLib.konwerter {
	
	[Bindable]
	public class KonwerterItem {

		public var label : String;
		public var val   : String;

		public function KonwerterItem(label:String, val:String) {
			this.val   = val;
			this.label = label;
		}

		public function toString():String {
			return label;
		}
	}
}