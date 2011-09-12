package pl.twerno.commLib.primitives.styles {
	import pl.twerno.commLib.primitives.GradientRectStyle;
	
	public class LightGreenStyle extends GradientRectStyle {
		public function LightGreenStyle() {
			super();

			gradient_rotation = 90;
			gradient_entry1   = 0xDDFFBC; 
			gradient_entry2   = 0xE2FFDB;
			strokeColor       = 0x4CFF53;
			strokeWeight      = 2;
			radiusX           = 0;
			radiusY           = 0;
			alpha             = 1;
		}
	}
}