if spawned.selected {
	spawned = behind;
	behind = instance_create_depth(x, y, -2, oCodeBlock, opts);
} else {
	event_user(0);
}