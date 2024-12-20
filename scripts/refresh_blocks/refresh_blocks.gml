function refresh_blocks(){
	with instance_find(oDevEnv, 0) {
		var _h = start.y + 40;
		for (var _i = 0; _i < array_length(global.program); ++_i;) {
			var _block = global.program[_i];
			_block.x = start.x;
			_block.y = _h;
			_h += _block.sprite_height - 8;
			with _block {
				reset_hitbox();
			}
		}
	}
}