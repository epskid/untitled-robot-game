if !global.can_start {
	return;
}

draw_sprite_ext(sTextBox, -1, 6, 36, 19, 18.5, 0, c_white, 1);
draw_sprite_ext(sTab, -1, string_length(tab_title), 8, 8, 1, 0, c_white, 1);
draw_set_color(c_dkgray);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(20, 20, tab_title);