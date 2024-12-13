ticks = 160;
oomph = animcurve_get_channel(acOomph, 1);

if global.can_start {
	// if the room restarted due to a player death, do not run the animation
	ticks = 0;
}

close = instance_create_depth(0, 10, -1, oCloseButton);