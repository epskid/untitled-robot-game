// recolor the sprite
image_blend = block_color;
// scale to fit text
image_xscale = ((16 * (string_length(msg) + 1)) / sprite_get_width(sprite_index));
image_yscale = 1.5;

// scale down if dying
var _scale_factor = alarm[0] / 10;
if alarm[0] != -1 {
	image_xscale *= _scale_factor;
	image_yscale *= _scale_factor;
}

// draw sprite
draw_self();

// lower down if not selected
if !selected {
	depth = -2;
}

if hitbox != noone && hitbox.intersecting && !instance_find(oStartBlock, 0).hitbox.intersecting {
	// if the user might drop on this block
	
	// find the first hitbox the user is intersecting with
	for (var _i = 0; _i < array_length(global.program); ++_i;) {
		if global.program[_i].hitbox.intersecting {
			if global.program[_i] == id {
				// if it is us, raise up and draw an indicator
				depth = -4;
				// note: I had to add a 1 opacity pixel to the top left corner of the sprite for it to scale properly for some reason
				draw_sprite_ext(sBlockOutline, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
			} else {
				// short-circuit on early failiure
				break;
			}
		}
	}
}

// set text color and alignment
draw_set_color(text_color);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if alarm[0] == -1 {
	// draw text normally if the block is alive
	draw_text(x + 8, y + 16, msg);
} else {
	// shrink text otherwise
	draw_text_transformed(x + (8 * _scale_factor), y + (16 * _scale_factor), msg, _scale_factor, _scale_factor, 0);
}