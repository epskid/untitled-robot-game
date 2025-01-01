if global.current_level > global.config.state.last_level {
	// if this level is the highest available, make a new one available on the menu
	global.config.state.last_level = global.current_level;
}

if global.current_level + 1 >= array_length(global.room_map) {
	// if this is the last level, go to the end
	go_to({
		room_to: rEnd,
		length: 500,
		on_spawn: function() {
			// fade out the music as soon as the transition starts
			global.audio_controller.fade_out_master = true;
		},
		on_die: function() {
			// fade in the music when it ends
			global.audio_controller.fade_in_master = true;
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