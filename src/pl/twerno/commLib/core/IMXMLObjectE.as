package pl.twerno.commLib.core {
	import mx.core.IMXMLObject;

	/**
	 * Extended interface of IMXMLObject.
	 * Allows for the properties written with 'initialized' method to be read.
	 */ 
	
	public interface IMXMLObjectE extends IMXMLObject {
		function get id():String;
		function get document():Object;
	}
}