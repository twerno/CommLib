package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class SaveButtonSkin extends GlyphedButton {
		public function SaveButtonSkin() {
			super();
			glyph = Images.get().diskImg;
		}
	}
}