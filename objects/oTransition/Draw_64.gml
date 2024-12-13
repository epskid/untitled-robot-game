if dir {
	// fade in while ascending
	draw_set_alpha(ticks / length);
} else {
	// fade out while descending
	draw_set_alpha(1 - (ticks / length));
}

draw_set_color(c_black);
// black out
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
draw_set_valign(fa_middle);
draw_set_halign(fa_center)
draw_set_color(c_white);
// center the text
draw_text(window_get_width() / 2, window_get_height() / 2, msg);
// make sure to reset alpha
draw_set_alpha(1);