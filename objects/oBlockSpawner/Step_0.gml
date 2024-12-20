if spawned.selected {
	// if the user picks up a block, move the one behind it to the top
	spawned = behind;
	// and replenish the behind
	behind = instance_create_depth(x, y, -2, oCodeBlock, opts);
} else {
	// align spawned/behind to current x/y
	// in an else block because we want the user to be able to move the block they  picked
	event_user(0);
}