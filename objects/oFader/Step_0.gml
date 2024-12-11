ticks--;

if global.can_start || ticks <= 0 {
	global.can_start = true;
	instance_destroy(oFader);
}