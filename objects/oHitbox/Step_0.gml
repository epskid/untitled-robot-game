image_xscale = width;
image_yscale = height;
var _insts = ds_list_create();
var _len = instance_place_list(x, y, obj, _insts, false);
intersecting = false;
for (var _i = 0; _i < _len; ++_i;) {
	var _inst = _insts[| _i];
	if (_inst != noone) && ((pred == noone) || pred(_inst)) {
		intersecting = true;
		break;
	}
}
ds_list_destroy(_insts);