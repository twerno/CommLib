package pl.twerno.commLib.collections {
	
	/**
	 * Map interface
	 */ 
	public interface IMap {
		
		function put(key:*, val:*):void;
		function get(key:*):*;
		function contains(key:*):Boolean;
		function remove(key:*):void;
		function removeByIdx(idx:uint):void;
		function clear():void;
		function keyAtIdx(idx:uint):*;
		function valAtIdx(idx:uint):*;
		function entryAtIdx(idx:uint):Object
		function toArray():Array;
		
		function get length():uint;
		function get isEmpty():Boolean;
	}
}