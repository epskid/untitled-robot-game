// if the dialog is done, don't draw it anymore
if !draw {
	return;
}

// scale sprite and draw speaker and text
image_xscale = 18;
image_yscale = 4;
draw_self();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_dkgray);
draw_text(x + 8, y + 8, speaker);
draw_text_ext(x + 8, y + 32, dialog[0], 16, sprite_width - 16);