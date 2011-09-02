package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class AddButtonSkin extends GlyphedButton {
		public function AddButtonSkin() {
			super();
			glyph = Images.get().addImg;
		}
	}
}