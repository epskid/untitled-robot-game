// scale to width and height in case they are updated
image_xscale = width;
image_yscale = height;

// make a list of all the intersecting objects
var _insts = ds_list_create();
var _len = instance_place_list(x, y, obj, _insts, false);
intersecting = false;
for (var _i = 0; _i < _len; ++_i;) {
	var _inst = _insts[| _i]; // what is this syntax lol
	if (_inst != noone) && ((pred == noone) || pred(_inst)) {
		// if there's a predicate to check, check it, otherwise it's intersecting
		intersecting = true;
		break;
	}
}
ds_list_destroy(_insts);