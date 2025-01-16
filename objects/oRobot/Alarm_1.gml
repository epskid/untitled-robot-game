if global.current_level > global.config.state.last_level {
	// if this level is the highest available, make a new one available on the menu
	global.config.state.last_level = global.current_level;
}

if global.current_level + 1 >= array_length(global.room_map) {
	// if this is the last level, go to the end
	go_to({
		msg: "Beginning Buffer Overflow Exploit...\n" + string_repeat(string_repeat("LIES", 128) + "\n", 64),
		room_to: rEnd,
		length: 24,
		on_spawn: function() {
			global.audio_controller.music_override = mCrit;
		}
	});
	return;
}

go_to({
	msg: "LEVEL " + string(global.current_level + 1),
	room_to: global.room_map[global.current_level + 1],
	on_transition: function() {
		// add extra code to enable can_start
		global.can_start = true;
	},
});