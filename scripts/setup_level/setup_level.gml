// this function is called by every level in the room creation code so I don't have to manually do this
function setup_level(spawn) {
	// create the development evironment
	instance_create_depth(0, 0, 0, oDevEnv, {
		tab_title: "LEVEL" + string_trim_start(room_get_name(room), ["rLevel"]) + ".URG",
		spawn: spawn
	});

	// create the viewport for the split-screen
	// these numbers are mythical in nature
	// they were forged in the fires of mount doom
	// tldr; i plugged in random numbers until it worked
	view_enabled = true;
	view_visible[0] = true;
	view_xport[0] = 32;
	view_yport[0] = 0;
	view_wport[0] = 64;
	view_hport[0] = 64;
	view_camera[0] = camera_create_view(0, 0, 128, 64);
	
	// reset program
	global.program = [];
}