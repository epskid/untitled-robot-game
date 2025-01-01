// get all section names
var _sections = variable_struct_get_names(global.config);

ini_open("urg.ini");

// iterate through the keys in the struct
for (var _i = array_length(_sections) - 1; _i >= 0; --_i) {
	// get the section name from the list
    var _section = _sections[_i];
	// get the value struct with the section name
    var _values = global.config[$ _section];
	// get the key names
	var _keys = variable_struct_get_names(_values);
	
	// iterate through the keys
	for (var _j = array_length(_keys) - 1; _j >= 0; --_j) {
		// get the key from the lists
	    var _key = _keys[_j];
		// get the value
	    var _value = _values[$ _key];
		
		// write to the INI file
		ini_write_real(_section, _key, _value);
	}
}

ini_close();