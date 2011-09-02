package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class CanceButtonSkin extends GlyphedButton {
		public function CanceButtonSkin() {
			super();
			glyph = Images.get().cancelImg;
		}
	}
}