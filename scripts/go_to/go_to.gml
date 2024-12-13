function go_to(var_struct) {
	// shorthand to create a transition to another room
	if !instance_exists(oTransition) {
		// high layer so it's on top of everything else
		instance_create_depth(0, 0, -9999, oTransition, var_struct);
	}
}