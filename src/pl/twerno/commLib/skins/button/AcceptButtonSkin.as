package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class AcceptButtonSkin extends GlyphedButton {
		public function AcceptButtonSkin(){
			super();
			glyph = Images.get().acceptImg;
		}
	}
}