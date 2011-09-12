package pl.twerno.commLib.primitives.styles {
	import pl.twerno.commLib.primitives.GradientRectStyle;

	public class LightBlueStyle extends GradientRectStyle {
		public function LightBlueStyle() {
			super();
			
			gradient_rotation = 90;
			gradient_entry1   = 0xBCDFFF; 
			gradient_entry2   = 0xDBE7FF;
			strokeColor       = 0x4C67FF;
			strokeWeight      = 1;
			radiusX           = 0;
			radiusY           = 0;
			alpha             = 1;
		}
	}
}