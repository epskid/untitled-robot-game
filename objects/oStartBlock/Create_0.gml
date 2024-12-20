hitbox = instance_create_depth(x, y + (sprite_height / 2), -2, oHitbox, {
	obj: oCodeBlock,
	pred: function(_inst) {
		return _inst.selected;
	},
	width: sprite_width,
	height: sprite_height
});
run = instance_create_depth(0, 0, -6, oWindowButton, {
	sprite: sRunProgram,
	do_something: function() {
		for (var _ip = 0; _ip < array_length(global.program); ++_ip;) {
			global.program[_ip].action();
		}
	}
});