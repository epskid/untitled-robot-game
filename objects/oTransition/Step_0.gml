if ticks++ > length {
	// hit end of period
	if !dir {
		// run the callback
		on_die();
		// if descending, the transition is over, and we die
		instance_destroy(id);
	} else {
		// if ascending, start descending and call the user callback
		dir = false;
		ticks = 0;
		on_transition();
	}
} else if dir && ticks == length {
	// when the screen is completely black, switch rooms
	room = room_to;	
}