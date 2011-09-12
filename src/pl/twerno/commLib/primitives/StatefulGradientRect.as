package pl.twerno.commLib.primitives {
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.utils.Dictionary;
	
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.SolidColorStroke;
	
	import spark.primitives.Rect;
	
	public class StatefulGradientRect extends Rect {

		public var states:Dictionary = new Dictionary();

		private var _currentStyle:GradientRectStyle;		
		private var _entry1:GradientEntry;
		private var _entry2:GradientEntry;
		private var _gradient:LinearGradient;
		private var _stroke:SolidColorStroke;
		private var _timeline:TimelineMax = new TimelineMax();
		private var _tempColors:Object;

		public function get currentStyle():GradientRectStyle {return _currentStyle}
		public function set currentStyle(style:GradientRectStyle):void {
			if (!states[style.id])
				addStyle(style);
			setStyle(style.id, 0);
		}
		
		public function set coverAllCanvas(val:Boolean):void {
			if (val) {
				this.top    = 0;
				this.left   = 0;
				this.right  = 0;
				this.bottom = 0;
			}
		}

		public function StatefulGradientRect(defaultStyle:GradientRectStyle = null) {
			super();
			_entry1           = new GradientEntry();
			_entry2           = new GradientEntry();
			_gradient         = new LinearGradient();
			_gradient.entries = [_entry1, _entry2];
			_stroke           = new SolidColorStroke();

			this.fill   = _gradient;
			this.stroke = _stroke;

			addStyle((defaultStyle) ? defaultStyle : 
				                      GradientRectStyle.getDefault('default'));
			setStyle((defaultStyle) ? defaultStyle.id : 
				                      'default', 0);
		}

		public function addStyle(style:GradientRectStyle):void {
			if (style.id == '') 
				throw new Error('Nazwa stylu nie może być pusta!');
			states[style.id] = style;
		}

		public function getStyle(styleName:String):GradientRectStyle {
			return states[styleName];
		}

		public function setStyle(styleName: String, duration: Number = 1):void {
			var newStyle:GradientRectStyle = getStyle(styleName);
			if (!newStyle) 
				throw new Error('Nie istnieje styl o nazwie: '+styleName +'!');
			if (_currentStyle == newStyle) return;
			tweenToStyle(newStyle, duration);
			_currentStyle = newStyle;
		}

		private function tweenToStyle(toStyle:GradientRectStyle, duration:Number):void {
			_timeline.stop();
			_timeline.clear();
			_timeline = new TimelineMax();
			_tempColors = {entry1: _entry1.color, 
						   entry2: _entry2.color, 
						   stroke    : _stroke.color};
			var colorsParams:Object = getStylesFor(toStyle, 
											[toStyle.GRADIENT_ENTRY_1, toStyle.GRADIENT_ENTRY_2, toStyle.STROKE_COLOR], 
											['entry1', 'entry2', 'stroke']);
			var gradientParams:Object = getStylesFor(toStyle, 
											[toStyle.GRADIENT_ROTATION], 
											['rotation']);
			var rectParams:Object = getStylesFor(toStyle, 
											[toStyle.RADIUS_X, toStyle.RADIUS_Y, toStyle.ALPHA], 
											['radiusX', 'radiusY', 'alpha']);
			_timeline.insertMultiple(
				[TweenMax.to(_tempColors, duration, {hexColors: colorsParams, onUpdate: updateVisual}),
			     TweenMax.to(_gradient, duration, gradientParams),
				 TweenMax.to(this, duration, rectParams)]);
			_stroke.weight = toStyle.strokeWeight;

			_timeline.play();
		}

		private function updateVisual():void {
			_entry1.color = _tempColors['entry1'];
			_entry2.color = _tempColors['entry2'];
			_stroke.color = _tempColors['stroke'];
		}
		
		private function getStylesFor(style:GradientRectStyle, keys:Array, properties:Array):Object {
			var key:String;
			var result:Object = new Object();
			for (var i:int = 0; i < keys.length; i++) {
				key = keys[i];
				if (style.hasVal(key))
					result[properties[i]] = style.getVal(key);
			}
			return result;
		}
	}
}