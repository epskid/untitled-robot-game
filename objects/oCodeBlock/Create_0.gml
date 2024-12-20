function reset_hitbox() {
	// utility function to relocate the hitbox of a block
	// destroy the old one
	if hitbox != noone {
		instance_destroy(hitbox);
	}
	// make a new one in the right place
	hitbox = instance_create_depth(x, y + (sprite_height / 2), -2, oHitbox, {
		obj: oCodeBlock,
		pred: function(_inst) {
			return _inst.selected;
		},
		width: sprite_width,
		height: sprite_height
	});
}

hovered = false;
selected = false;
depth = -2;
hitbox = noone;