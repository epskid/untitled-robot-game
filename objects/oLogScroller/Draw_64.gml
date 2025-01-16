// maximize gui to fit window
display_set_gui_maximize();

for (var _i = 0; _i <= idx; ++_i;) {
	// set text color, font, and align
	draw_set_color(c_white);
	draw_set_font(fntBreakout);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// draw text at the correct line
	draw_text(0, 12 * _i, lines[_i]);
}