package pl.twerno.commLib.primitives.styles {
	import pl.twerno.commLib.primitives.GradientRectStyle;
	
	public class LightRedStyle extends GradientRectStyle {
		public function LightRedStyle() {
			super();
			
			gradient_rotation = 90;
			gradient_entry1   = 0xFFB587; 
			gradient_entry2   = 0xFFDEB7;
			strokeColor       = 0xFF2E23;
			strokeWeight      = 3;
			radiusX           = 0;
			radiusY           = 0;
			alpha             = 1;		
		}
	}
}