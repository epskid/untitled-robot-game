// you can't use the built-in events on GUI layer objects, so improvisation is necessary

hovered = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if hovered && mouse_check_button(mb_left) {
	// shorter transition on exit
	go_to({
		room_to: rMainMenu,
		msg: choose("Ever heard of Arch Linux?\nThat's what I use.\nBTW.", "Press ALT-F4 to close the game.", "To breathe, inhale, then exhale.", "A GML Code by any other name would suck as much.\n-- Will.i.am", "99% of gamblers quit before winning big!", "Have you asked ChatGPT yet?", "Studies show that programmers who touch grass\nare '10 times less skilled than those who do'\nSource: Trust Me Bro"),
		length: 50,
	});
}