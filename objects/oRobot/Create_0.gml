// initialize the variables

enum MoveDirection {
	NONE,
	LEFT,
	RIGHT,
	UP,
	DOWN,
}

robotSize = 8;
movementCurveChannel = animcurve_get_channel(acOomph, 0);
squashCurveChannelMinor = animcurve_get_channel(acSquash, 0);
squashCurveChannelMajor = animcurve_get_channel(acSquash, 1);
movementTime = 0.0;
realX = x;
realY = y;
moveDirections = [MoveDirection.NONE];
died = false
ground = layer_tilemap_get_id("lGround")
overlay = layer_tilemap_get_id("lOverlay")
layer = layer_get_id("lMain")
spawned = false
image_xscale = 0
image_yscale = 0
alarm[0] = 30