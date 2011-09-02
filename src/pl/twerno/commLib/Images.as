package pl.twerno.commLib {
	public class Images {
		
		[Embed("assets/disk.png")]
		public const diskImg:Class;
		
		[Embed("assets/add.png")]
		public const addImg:Class;
		
		[Embed("assets/delete.png")]
		public const deleteImg:Class;
		
		[Embed("assets/key.png")]
		public const keyImg:Class;
		
		[Embed("assets/key_add.png")]
		public const key_addImg:Class;
		
		[Embed("assets/exclamation.png")]
		public const exclamationImg:Class;
		
		[Embed("assets/group.png")]
		public const groupImg:Class;
		
		[Embed("assets/user_green.png")]
		public const user_greenImg:Class;
		
		[Embed("assets/accept.png")]
		public const acceptImg:Class;
		
		[Embed("assets/plugin.png")]
		public const pluginImg:Class;
		
		[Embed("assets/brick.png")]
		public const brickImg:Class;
		
		[Embed("assets/brick_add.png")]
		public const brick_addImg:Class;
		
		[Embed("assets/brick_delete.png")]
		public const brick_deleteImg:Class;
		
		[Embed("assets/brick_go.png")]
		public const brick_goImg:Class;
		
		[Embed("assets/house.png")]
		public const houseImg:Class;
		
		[Embed("assets/script.png")]
		public const scriptImg:Class;
		
		[Embed("assets/script_edit.png")]
		public const script_editImg:Class;
		
		[Embed("assets/cancel.png")]
		public const cancelImg:Class;
		
		[Embed("assets/clock.png")]
		public const clockImg:Class;
		
		[Embed("assets/controller.png")]
		public const controllerImg:Class;
		
		private static var _images : Images;
		public static function get():Images {
			if (!_images) {_images = new Images()}
			return _images;
		}
		
		public function Images() {
			if (_images) {
				throw new Error('Images może być tylko jeden.');
			}
		}
	}
}