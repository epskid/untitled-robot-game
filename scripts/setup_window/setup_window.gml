function setup_window() {
	// set title and cursor
	window_set_caption("UNTITLED ROBOT GAME");
	window_set_cursor(cr_none);
	global.program = [];
	global.room_map = [];
	
	// iterate through all rooms and add them to the array
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
		
		global.room_map[_num] = _i;
	}
}

// mysterious GML code dark magic to run on startup
gml_pragma("global", "setup_window()");