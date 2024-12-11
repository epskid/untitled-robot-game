draw_set_alpha(min(ticks / 50, 1));
draw_set_color(c_black);
draw_rectangle(0, 0, window_get_width(), window_get_height(), false);

draw_set_font(fntUi);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text(window_get_width() / 2, window_get_height() / 2, msg);
draw_set_valign(fa_top);
draw_text(window_get_width() / 2, window_get_height() / 2, desc);
draw_set_alpha(1);