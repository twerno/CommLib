package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class ControllerButtonSkin extends GlyphedButton {
		public function ControllerButtonSkin() {
			super();
			glyph = Images.get().controllerImg;
		}
	}
}