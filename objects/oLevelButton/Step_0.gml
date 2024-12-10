if hover {
	image_xscale = min(image_xscale + 0.01, 1.1);
	image_yscale = min(image_yscale + 0.01, 1.1);
} else {
	image_xscale = max(image_xscale - 0.02, 1);	
	image_yscale = max(image_yscale - 0.02, 1);
}

x = rx + ((1 - image_xscale) * sprite_width) / 2;
y = ry + ((1 - image_yscale) * sprite_height) / 2;