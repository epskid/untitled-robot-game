ticks = 160;
oomph = animcurve_get_channel(acOomph, 1);

if global.can_start {
	// if the room restarted due to a player death, do not run the animation
	ticks = 0;
}

// create the basic elements:
// the starting block
start = instance_create_depth(0, 64, -1, oStartBlock);
// the close button
close = instance_create_depth(0, 10, -1, oWindowButton, {
	sprite: sClose,
	do_something: function() {
		// shorter transition on exit
		go_to({
			room_to: rMainMenu,
			msg: choose("You can do it!", "Robbie needs your help!", "You must go on.", "Okay, take a break while Robbie suffers alone."),
			length: 50,
		});
	}
});
// the retry button
retry = instance_create_depth(0, 16, -1, oWindowButton, {
	sprite: sRetry,
	do_something: function() {
		instance_create_depth(0, 0, 0, oRetryer);
	},
	shortcut: vk_escape
});
// and the run button
run = instance_create_depth(0, 16, -6, oWindowButton, {
	sprite: sRunProgram,
	do_something: function() {
		global.program_started = true;
		for (var _ip = 0; _ip < array_length(global.program); ++_ip;) {
			global.program[_ip].action();
		}
		global.robot.program_done = true;
	},
	shortcut: vk_enter
});

// initialize all the block spawners
spawners = [];

for (var _i = 0; _i < array_length(spawn); ++_i;) {
	array_push(spawners, instance_create_depth(0, 72 + (64 * _i), -2, oBlockSpawner, { opts: spawn[_i] }));
}