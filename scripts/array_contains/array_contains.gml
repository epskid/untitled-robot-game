function array_contains(arr, elem) {
	for (var _i = 0; _i < array_length(arr); ++_i;) {
		if arr[_i] == elem {
			return true;
		}
	}
	
	return false;
}