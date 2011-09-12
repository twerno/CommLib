package pl.twerno.commLib.core {
	
	/**
	 * Implementation of pl.twerno.commLib
	 */ 
	
	public class MXMLObject implements IMXMLObjectE {
		private var _id:String;
		private var _document:Object;
		
		public function get id():String {return _id}
		public function get document():Object {return _document}
		
		public function initialized(document:Object, id:String):void {
			_id       = id;
			_document = document;
		}
	}
}