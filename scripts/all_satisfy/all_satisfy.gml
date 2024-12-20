// implementing what should be built in
// a function that checks if all objects satisfy a condition
// I get why it might not exist for objects, but for arrays there's no excuse
function all_satisfy(obj, sat) {	
	for (var _i = 0; _i < instance_number(obj); ++_i;) {
		if !sat(instance_find(obj, _i)) {
			return false;
		}
	}
	
	return true;
}