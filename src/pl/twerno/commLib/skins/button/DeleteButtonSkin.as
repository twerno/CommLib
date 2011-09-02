package pl.twerno.commLib.skins.button {
	import pl.twerno.commLib.Images;

	public class DeleteButtonSkin extends GlyphedButton {
		public function DeleteButtonSkin() {
			super();
			glyph = Images.get().deleteImg;
		}
	}
}