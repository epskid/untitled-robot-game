function all_satisfy(obj, sat) {	
	for (var _i = 0; _i < instance_number(obj); ++_i;) {
		if !sat(instance_find(obj, _i)) {
			return false;
		}
	}
	
	return true;
}