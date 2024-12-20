if alarm[0] != -1 {
	return;
}

var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);
hovered = position_meeting(_mouse_x, _mouse_y, id);

if hovered && mouse_check_button_pressed(mb_left) && all_satisfy(oCodeBlock, function (block) { return !block.selected; }) {
	var _prog_idx = array_index_of(global.program, id);
	if _prog_idx != noone {
		array_delete(global.program, _prog_idx, 1);
		refresh_blocks();
	}
	
	mouse_x_off = x - _mouse_x;
	mouse_y_off = y - _mouse_y;
	selected = true;
	
	depth = -10;
	
	instance_destroy(hitbox);
	hitbox = noone;
} else if selected && mouse_check_button(mb_left) {
	x = _mouse_x + mouse_x_off;
	y = _mouse_y + mouse_y_off;
} else if selected && !mouse_check_button(mb_left) {
	depth = -2;
	var _snapped = false;
		
	var _start = instance_find(oStartBlock, 0);
	if _start.hitbox.intersecting {
		array_insert(global.program, 0, id);
		_snapped = true;
	}
	
	if !_snapped {
		for (var _i = 0; _i < array_length(global.program); ++_i;) {
			var _inst = global.program[_i];
			if _inst.hitbox.intersecting {
				array_insert(global.program, _i + 1, id);
				_snapped = true;
				break;
			}
		}
	}
			
	if !_snapped {
		alarm[0] = 10;
	} else {
		refresh_blocks();
		hitbox = instance_create_depth(x, y + (sprite_height / 2), -2, oHitbox, {
			obj: oCodeBlock,
			pred: function(_inst) {
				return _inst.selected;
			},
			width: sprite_width,
			height: sprite_height
		});
	}

	selected = false;
}