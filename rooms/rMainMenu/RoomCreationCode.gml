if !instance_exists(oAudioController) {
	// create an audio controller on first run
	instance_create_depth(0, 0, 0, oAudioController);
}

// reset can_start
global.can_start = false;

// iterate through all rooms and make a button if they are a level
for (var _i = 0; _i <= room_last; _i++) {
	var _room_name = room_get_name(_i);
	if !string_starts_with(_room_name, "rLevel") {
		// skip non-level rooms
		continue;
	}
	// extract level index from room name
	var _lvl = string_trim_start(_room_name, ["rLevel"]);	

	// parse level index from string to int
	var _num = real(_lvl);
	// create a button in the correct position to create an 8-wide grid
	instance_create_layer(room_width - (8 * 96) + ((_num - 1) % 8) * 96, 128 + (floor((_num - 1) / 8) * 96), "lButtons", oButton, {
		msg: _lvl,
		// ugly scope hack...
		scope: {
			num: _lvl,
			room_idx: _i,
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
}