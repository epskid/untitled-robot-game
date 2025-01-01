ini_open("urg.ini");

// check if the ini file has data in it
if !ini_section_exists("prefs") {
	// create default values on first run
	ini_write_real("prefs", "volume", 1);
	ini_write_real("state", "last_level", 0);
}

// i couldn't find a way to dynamically deserialize ini files with this version of gamemaker =(
global.config = {
	prefs: {
		volume: ini_read_real("prefs", "volume", 1),
	},
	state: {
		last_level: ini_read_real("state", "last_level", 0)
	}
};
	
ini_close();