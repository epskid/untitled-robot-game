ticks = 160;
oomph = animcurve_get_channel(acOomph, 1);

if global.can_start {
	// if the room restarted due to a player death, do not run the animation
	ticks = 0;
}

start = instance_create_depth(0, 64, -1, oStartBlock);
close = instance_create_depth(0, 10, -1, oWindowButton, {
	sprite: sClose,
	do_something: function() {
		// shorter transition on exit
		go_to({
			room_to: rMainMenu,
			msg: choose("Ever heard of Arch Linux?\nThat's what I use.\nBTW.", "Press ALT-F4 to close the game.", "To breathe, inhale, then exhale.", "A GML Code by any other name would suck as much.\n-- William Shakespeare during the making of Undertale", "99% of gamblers quit before winning big!", "Have you asked ChatGPT yet?", "Studies show that programmers who touch grass\nare '10 times less skilled than those who do'\nSource: Trust Me Bro"),
			length: 50,
		});
	}
});
spawners = [];

for (var _i = 0; _i < array_length(spawn); ++_i;) {
	array_push(spawners, instance_create_depth(0, 84 + (72 * _i), -2, oBlockSpawner, { opts: spawn[_i] }));
}