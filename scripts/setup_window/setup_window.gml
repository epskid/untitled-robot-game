function setup_window() {
	// set title and cursor
	window_set_caption("UNTITLED ROBOT GAME");
	window_set_cursor(cr_none);
	cursor_sprite = sCursor;
}

// mysterious GML code dark magic to run on startup
gml_pragma("global", "setup_window()");