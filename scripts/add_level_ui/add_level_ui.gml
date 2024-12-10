function add_level_ui() {
	view_camera[0] = camera_create();
	camera_set_view_size(view_camera[0], 640, 640);
	view_enabled = true;
	view_visible[0] = true;
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = 64;
	view_hport[0] = 64;
}