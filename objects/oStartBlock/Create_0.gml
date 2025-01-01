// create hitbox
hitbox = instance_create_depth(x, y + (sprite_height / 2), -2, oHitbox, {
	obj: oCodeBlock,
	pred: function(_inst) {
		return _inst.selected;
	},
	width: sprite_width,
	height: sprite_height
});