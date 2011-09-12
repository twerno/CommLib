package pl.twerno.commLib.primitives {
	import pl.twerno.commLib.collections.Map;
	import pl.twerno.commLib.core.MXMLObject;
	import pl.twerno.commLib.helpers.StringHelper;

	public class GradientRectStyle extends MXMLObject {

		internal const ALPHA             : String = 'ALPHA';
		internal const RADIUS_X          : String = 'RADIUS_X';
		internal const RADIUS_Y          : String = 'RADIUS_X';
		internal const STROKE_COLOR      : String = 'STROKE_COLOR';
		internal const STROKE_WEIGHT     : String = 'STROKE_WEIGHT';
		internal const GRADIENT_ENTRY_1  : String = 'GRADIENT_ENTRY_1';
		internal const GRADIENT_ENTRY_2  : String = 'GRADIENT_ENTRY_2';
		internal const GRADIENT_ROTATION : String = 'GRADIENT_ROTATION';
		
		private var values:Map = new Map();

		public function GradientRectStyle() {
		}

		public function clearAlpha():void {clearVal(ALPHA)}
		public function hasAlpha():Boolean {return hasVal(ALPHA)}
		public function get alpha():Number {return getVal(ALPHA)}
		public function set alpha(value:Number):void {setVal(ALPHA, value)}
		
		public function clearRadiusX():void {clearVal(RADIUS_X)}
		public function hasRadiusX():Boolean {return hasVal(RADIUS_X)}
		public function get radiusX():Number {return getVal(RADIUS_X)}
		public function set radiusX(value:Number):void {setVal(RADIUS_X, value)}

		public function clearRadiusY():void {clearVal(RADIUS_Y)}
		public function hasRadiusY():Boolean {return hasVal(RADIUS_Y)}
		public function get radiusY():Number {return getVal(RADIUS_Y)}
		public function set radiusY(value:Number):void {setVal(RADIUS_Y, value)}
		
		public function clearStrokeColor():void {clearVal(STROKE_COLOR)}
		public function hasStrokeColor():Boolean {return hasVal(STROKE_COLOR)}
		public function get strokeColor():Number {return getVal(STROKE_COLOR)}
		public function set strokeColor(value:Number):void {setVal(STROKE_COLOR, value)}
		
		public function clearStrokeWeight():void {clearVal(STROKE_WEIGHT)}
		public function hasStrokeWeight():Boolean {return hasVal(STROKE_WEIGHT)}
		public function get strokeWeight():Number {return getVal(STROKE_WEIGHT)}
		public function set strokeWeight(value:Number):void {setVal(STROKE_WEIGHT, value)}
		
		public function clearGradient_entry1():void {clearVal(GRADIENT_ENTRY_1)}
		public function hasGradient_entry1():Boolean {return hasVal(GRADIENT_ENTRY_1)}
		public function get gradient_entry1():Number {return getVal(GRADIENT_ENTRY_1)}
		public function set gradient_entry1(value:Number):void {setVal(GRADIENT_ENTRY_1, value)}
		
		public function clearGradient_entry2():void {clearVal(GRADIENT_ENTRY_2)}
		public function hasGradient_entry2():Boolean {return hasVal(GRADIENT_ENTRY_2)}
		public function get gradient_entry2():Number {return getVal(GRADIENT_ENTRY_2)}
		public function set gradient_entry2(value:Number):void {setVal(GRADIENT_ENTRY_2, value)}

		public function clearGradient_rotation():void {clearVal(GRADIENT_ROTATION)}
		public function hasGradient_rotation():Boolean {return hasVal(GRADIENT_ROTATION)}
		public function get gradient_rotation():Number {return getVal(GRADIENT_ROTATION)}
		public function set gradient_rotation(value:Number):void {setVal(GRADIENT_ROTATION, value)}		

		public override function initialized(document:Object, id:String):void {
			if (id == '') 
				throw new Error('Nazwa stylu nie może być pusta!');
			if (!StringHelper.isEmpty(this.id)) 
				throw new Error('Styl ma już nazwę: '+ id +'!');
			super.initialized(document, id);
		}		

		public static function getDefault(styleName: String):GradientRectStyle {
			var style:GradientRectStyle = new GradientRectStyle();
			style.initialized(null, styleName);
			return style;
		}

		public function set assignTo(rect:StatefulGradientRect):void {
			if (!rect.getStyle(id)) rect.addStyle(this);
		}
		
		internal function setVal(valName:String, val:*):void {
			values.put(valName, val);
		}
		
		internal function getVal(valName:String):* {
			return values.get(valName);
		} 
		
		internal function hasVal(valName:String):Boolean {
			return values.contains(valName);
		}
		
		internal function clearVal(valName:String):void {
			values.remove(valName);
		}
	}
}