instance_create_depth(0, 0, 0, oAudioController);
global.can_start = false;

for (var _i = 0; _i <= room_last; _i++) {
	var _split = string_split(room_get_name(_i), "rLevel", true);
	if string_starts_with(_split[0], "r") {
		continue;
	}
	var _num = real(_split[0]);
	instance_create_layer(room_width - (8 * 96) + ((_num - 1) % 8) * 96, 128 + (floor((_num - 1) / 8) * 96), "lButtons", oLevelButton, {
		msg: _split[0],
		room_idx: _i,
	});
}