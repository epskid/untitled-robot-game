image_blend = color;
if disabled {
	// disabled buttons are always gray
	image_blend = c_ltgray;
}
// draw the sprite
draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntUi);

draw_set_color(text_color);
// center the text on the button
draw_text(x + sprite_width / 2, y + sprite_height / 2 - 4, msg);

if disabled {
	// draw a padlock over disabled buttons
	draw_sprite(sPadlock, 0, x + sprite_width / 2, y + sprite_height / 2 - 4);
}