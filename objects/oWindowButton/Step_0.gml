// you can't use the built-in events on GUI layer objects, so improvisation is necessary

hovered = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if hovered && mouse_check_button(mb_left) {
	do_something();
}