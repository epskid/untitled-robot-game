// initialize the variables (ignore how these variables use camel case whereas everything else uses snake case please)

enum MoveDirection {
	// for ease of programming
	NONE,
	
	// move commands
	LEFT,
	RIGHT,
	UP,
	DOWN,
	
	// wait commands
	W_LEFT,
	W_RIGHT,
	W_UP,
	W_DOWN,
}

enum WaitState {
	NOTHING_YET,
	BUG_HERE,
}

waitState = WaitState.NOTHING_YET;
won = false;
robotSize = 8;
movementCurveChannel = animcurve_get_channel(acOomph, 0);
winCurveChannel = animcurve_get_channel(acOomph, 1);
squashCurveChannelMinor = animcurve_get_channel(acSquash, 0);
squashCurveChannelMajor = animcurve_get_channel(acSquash, 1);
movementTime = 0.0;
realX = x;
realY = y;
moveDirections = [MoveDirection.NONE];
died = false;
ground = layer_tilemap_get_id("lGround");
overlay = layer_tilemap_get_id("lOverlay");
obstacles = layer_tilemap_get_id("lObstacles");
layer = layer_get_id("lMain");
spawned = false;
program_done = false;
image_xscale = 0;
image_yscale = 0;
alarm[0] = 30;

global.robot = id;