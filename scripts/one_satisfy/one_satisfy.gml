// another should-exist
// just checks if one object satisfies
function one_satisfy(obj, sat) {	
	for (var _i = 0; _i < instance_number(obj); ++_i;) {
		if sat(instance_find(obj, _i)) {
			return true;
		}
	}
	
	return false;
}