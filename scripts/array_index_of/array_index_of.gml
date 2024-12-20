// because gamemaker lts doesnt have an index of function???
function array_index_of(arr, elem) {
	for (var _i = 0; _i < array_length(arr); ++_i;) {
		if arr[_i] == elem {
			return _i;
		}
	}
	
	return noone;
}