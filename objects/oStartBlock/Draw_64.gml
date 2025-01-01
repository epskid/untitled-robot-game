image_blend = #f4ec07;
image_xscale = (96 / sprite_get_width(sprite_index));
image_yscale = 1.5;
draw_self();
draw_set_color(c_white);
draw_text(x + 8, y + 16, "START");

if hitbox.intersecting {
	// draw the outline on intersect
	draw_sprite_ext(sBlockOutline, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	depth = -5;
} else {
	depth = -2;
}