// define some basic blocks that just show popups
setup_level([
	{ msg: "hello", block_color: c_red, text_color: c_white, action: function() { show_message("Hello!"); } },
	{ msg: "goodbye", block_color: c_green, text_color: c_white, action: function() { show_message("Goodbye!"); } }
]);