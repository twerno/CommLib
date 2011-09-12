package pl.twerno.commLib.primitives.styles {
	import pl.twerno.commLib.primitives.GradientRectStyle;

	public class WhiteStyle extends GradientRectStyle {
		public function WhiteStyle() {
			super();
			
			gradient_rotation = 90;
			gradient_entry1   = 0xFFFFFF; 
			gradient_entry2   = 0xFFFFFF;
			strokeColor       = 0x000000;
			strokeWeight      = 1;
			radiusX           = 0;
			radiusY           = 0;
			alpha             = 1;
		}
	}
}