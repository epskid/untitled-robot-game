if ticks > 0 {
	ticks--;
}

// calculate the x-offset from the final position using an animation curve
var _xdiff = 640 * animcurve_channel_evaluate(oomph, ticks / 100);

// move everything using said x-offset
close.x = 586 - _xdiff;
retry_btn.x = 308 - _xdiff;
start.x = 96 - _xdiff;
with start {
	// call the step event on start to make sure its x and y values are updated
	event_user(0);
}
for (var _i = 0; _i < array_length(spawners); ++_i;){
	spawners[_i].x  = 416 - _xdiff;
	
	with spawners[_i] {
		// call the step event on all the block spawners to align x and y
		event_user(0);
	}
}

draw_sprite_ext(sDevWall, -1, 0, 0, 10, 10, 0, c_white, 1);
draw_sprite_ext(sTextBox, -1, 16 - _xdiff, 2, 19, 18, 0, c_ltgrey, 1);
draw_sprite_ext(sTextBox, -1, 16 - _xdiff, 36, 19, 18.5, 0, c_white, 1);
draw_sprite_ext(sTextBox, -1, 400 - _xdiff, 60, 7, 17, 0, c_ltgrey, 1);
draw_sprite_ext(sTab, -1, 24 - _xdiff, 8, 10, 1, 0, c_white, 1);
draw_set_color(c_dkgray);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(32 - _xdiff, 20, tab_title);

// this has no sprite, so we don't need a dummy draw event