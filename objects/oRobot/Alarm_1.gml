if global.current_level + 1 >= array_length(global.room_map) {
	go_to({
		room_to: rEnd,
		length: 500,
		on_spawn: function() {
			global.audio_controller.fade_out_master = true;
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