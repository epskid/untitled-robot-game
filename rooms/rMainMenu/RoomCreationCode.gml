instance_create_depth(0, 0, 0, oCheatcodeManager);

if !instance_exists(oIniManager) {
	// load urg.ini
	instance_create_depth(0, 0, 0, oIniManager);
}

if !instance_exists(oAudioController) {
	// create an audio controller on first run
	global.audio_controller = instance_create_depth(0, 0, 0, oAudioController);
}

if !instance_exists(oCursorController) {
	// create the cursor controller on first run
	instance_create_depth(0, 0, 0, oCursorController);
}

// reset can_start
global.can_start = false;

// iterate through all rooms and make a button if they are a level
for (var _num = 1; _num < array_length(global.room_map); _num++) {
	var _btn_x = room_width - (8 * 96) + ((_num - 1) % 8) * 96
	var _btn_y = 128 + (floor((_num - 1) / 8) * 96);
	if global.no_progression || (_num <= (global.config.state.last_level + 1)) {
		// create a button in the correct position to create an 8-wide grid
		instance_create_layer(_btn_x, _btn_y, "lButtons", oButton, {
			msg: string(_num),
			// ugly scope hack...
			scope: {
				num: string(_num),
				room_idx: global.room_map[_num],
			},
			on_click: function(scope) {
				go_to({
					msg: "LEVEL " + scope.num,
					room_to: scope.room_idx,
					on_transition: function() {
						// add extra code to enable can_start
						global.can_start = true;
					},
				});
			}
		});
	} else {
		instance_create_layer(_btn_x, _btn_y, "lButtons", oButton, {
			msg: string(_num),
			disabled: true,
		});
	}
}