// iteratively delete everything in the program, in reverse to avoid index OOB errors
for (var _i = array_length(global.program) - 1; _i >= 0; --_i;) {
	with global.program[_i] {
		if alarm[0] == -1 {
			// set doomsday clock
			alarm[0] = 10;
		}
	}
	if !instance_exists(global.program[_i]) {
		array_delete(global.program, _i, 1);
	}
}
	
if array_length(global.program) == 0 {
	room_restart();
}