ticks = 150;
oomph = animcurve_get_channel(acOomph, 1);

if global.can_start {
	ticks = 0;
}

close = instance_create_depth(0, 10, -1, oCloseButton);