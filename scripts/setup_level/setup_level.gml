function setup_level(level, desc) {
	instance_create_depth(0, -100, 0, oFader, {
		msg: "LEVEL " + level,
		desc: desc,
	});
	instance_create_depth(0, 0, 0, oDevEnv, {
		tab_title: "LEVEL" + level + ".URG",
	});

	view_enabled = true;
	view_visible[0] = true;
	view_xport[0] = 32;
	view_yport[0] = 0;
	view_wport[0] = 64;
	view_hport[0] = 64;
	view_camera[0] = camera_create_view(0, 0, 128, 64);
}