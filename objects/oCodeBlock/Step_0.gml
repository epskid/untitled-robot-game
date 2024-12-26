if alarm[0] != -1 {
	// if the death alarm is running, don't bother with anything else
	return;
}

// check if the user is hovering the code block
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);
hovered = position_meeting(_mouse_x, _mouse_y, id);

if hovered && mouse_check_button_pressed(mb_left) && all_satisfy(oCodeBlock, function (block) { return !block.selected; }) {
	// if the user is hovering, pressing the left mouse button, and not holding any other block, select it
	var _prog_idx = array_index_of(global.program, id);
	if _prog_idx != noone {
		// if the block is in the current program, then remove it
		array_delete(global.program, _prog_idx, 1);
		// move the other blocks into the correct position
		refresh_blocks();
	}
	
	// store mouse x and y offsets to drag nicer
	mouse_x_off = x - _mouse_x;
	mouse_y_off = y - _mouse_y;

	// set selected
	selected = true;

	// make it appear above everything else
	depth = -10;
	
	// remove the old hitbox if it exists
	if hitbox != noone {
		instance_destroy(hitbox);
		hitbox = noone;
	}
} else if selected && mouse_check_button(mb_left) {
	// follow the mouse if the user is holding the block
	x = _mouse_x + mouse_x_off;
	y = _mouse_y + mouse_y_off;
} else if selected && !mouse_check_button(mb_left) {
	// if the user drops the block
	var _snapped = false;
	
	// check if it can snap to the start block
	var _start = instance_find(oStartBlock, 0);
	if _start.hitbox.intersecting {
		// add it to the program if it can
		array_insert(global.program, 0, id);
		_snapped = true;
	}
	
	if !_snapped {
		// if it didn't snap to the start block
		// iterate the the program and find the first block it can snap to
		for (var _i = 0; _i < array_length(global.program); ++_i;) {
			var _inst = global.program[_i];
			if _inst.hitbox.intersecting {
				// insert after the snapped block
				array_insert(global.program, _i + 1, id);
				_snapped = true;
				// leave; we found the block to snap to
				break;
			}
		}
	}
			
	if !_snapped {
		// if it didn't snap to anything, delete it (set the death alarm)
		alarm[0] = 10;
	} else {
		// if it did snap,
		// refresh the positions of the other blocks on the screen
		refresh_blocks();
		// create a snapping hitbox
		reset_hitbox();
		// play the snapping sound
		audio_play_sound(mSnap, 1, false);
	}

	// reset selected
	selected = false;
}