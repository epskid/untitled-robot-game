if disabled {
	// don't worry about hover-scaling when the button is disabled
	return;
}

if hover {
	// scale up the image at a rate of 0.01 per frame, clamping at 1.1
	image_xscale = min(image_xscale + 0.01, 1.1);
	image_yscale = min(image_yscale + 0.01, 1.1);
} else {
	// scale down the image at a rate of 0.02 per frame, clamping at 1
	image_xscale = max(image_xscale - 0.02, 1);	
	image_yscale = max(image_yscale - 0.02, 1);
}

// center the scaled button
x = rx + ((1 - image_xscale) * sprite_width) / 2;
y = ry + ((1 - image_yscale) * sprite_height) / 2;