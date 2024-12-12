if ticks > 0 {
	ticks--;
}

var _xdiff = 640 * animcurve_channel_evaluate(oomph, ticks / 100);

close.x = 590 - _xdiff;

draw_sprite_ext(sDevWall, -1, 0, 0, 10, 10, 0, c_white, 1);
draw_sprite_ext(sTextBox, -1, 16 - _xdiff, 36, 19, 18.5, 0, c_white, 1);
draw_sprite_ext(sTab, -1, 16 - _xdiff, 8, string_length(tab_title), 1, 0, c_white, 1);
draw_set_color(c_dkgray);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(32 - _xdiff, 20, tab_title);