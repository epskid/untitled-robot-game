function instance_nearest_not_me(me, obj) {
	var _min_dist = infinity;
	var _min_obj = noone;
	for (var _i = 0; _i < instance_number(obj); ++_i;) {
		var _itered = instance_find(obj, _i);
		if _itered != me {
			with me {
				var _new_dist = distance_to_object(_itered);
				if _new_dist < _min_dist {
					_min_dist = _new_dist;
					_min_obj = _itered;
				}
			}
		}
	}
	
	return _min_obj;
}