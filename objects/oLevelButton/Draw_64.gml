/// @description Draw Button

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntUi);

draw_set_color(c_white);
draw_text(x + sprite_width / 2, y + sprite_height / 2 - 4, msg);

draw_set_halign(fa_left);
draw_set_valign(fa_top);