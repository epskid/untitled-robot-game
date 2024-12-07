/// @description Initialize Robot

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
layer = layer_get_id("lMain")