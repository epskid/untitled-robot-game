if hovered {
	// darkens slightly
	image_blend = c_ltgrey;
} else {
	image_blend = -1;
}

// draw the sprite
draw_self();