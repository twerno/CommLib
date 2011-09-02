package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;
	
	public class KeyButtonSkin extends GlyphedButton {
		public function KeyButtonSkin() {
			super();
			glyph = Images.get().keyImg;
		}
	}
}