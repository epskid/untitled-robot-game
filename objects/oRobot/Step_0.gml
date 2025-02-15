// declare some basic helper functions

// checks if an x and y position is out of bounds or colliding with an obstacle
function is_oob(dx, dy) {
	return (dx < -1) || (dx >= room_width) || (dy < 0) || (dy >= room_height - 1) || (tilemap_get_at_pixel(obstacles, dx + 2, dy + 2) != 0);
}

// resets x and y to real positions
function reset_real() {
	x = realX;
	y = realY;
	movementTime = 0;
	moveDirections[0] = MoveDirection.NONE;
}

// evaluate a movement curve using the movementTime variable
function eval_move_curve(curve) {
	return animcurve_channel_evaluate(curve, movementTime);
}

// change the alpha if the player is obscured behind an overlay
function update_alpha(newRealX, newRealY) {
	// check if the player is on an overlay object in the tilemap
	if tilemap_get_at_pixel(overlay, newRealX + 2, newRealY + 2) != 0 {
		// minimum 0.25 opacity
		image_alpha = max(image_alpha - 0.1, 0.25);
	} else {
		image_alpha = min(image_alpha + 0.1, 1);
	}
}

if !spawned {
	// scale up on a curve while spawning
	image_xscale = animcurve_channel_evaluate(movementCurveChannel, (30 - alarm[0]) / 30);
	image_yscale = animcurve_channel_evaluate(movementCurveChannel, (30 - alarm[0]) / 30);
	// center after scale
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * robotSize) / 2;
	return;
}

if won {
	// scale down in a bouncy way
	image_xscale = max(-5 * animcurve_channel_evaluate(winCurveChannel, (100 - alarm[1]) / 100) + 1, 0);
	image_yscale = max(-5 * animcurve_channel_evaluate(winCurveChannel, (100 - alarm[1]) / 100) + 1, 0);
	// center after scale
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * robotSize) / 2;
	return;
}

won = place_meeting(realX, realY, oGoal);

if won {
	// play a little jingle and start the win-timer
	audio_play_sound(mSuccess, 10000, false);
	alarm[1] = 100;
}

// if you're not on the ground, you're dead
if !died && tilemap_get_at_pixel(ground, realX + 1, realY + 1) == 0 {
	died = true;
	// move to a layer behind the ground for added effect on the fall
	layer = layer_get_id("lDeath");
} else if !died && place_meeting(realX, realY, oBug) {
	died = true;
}

if died {
	// scale down at a constant rate while falling
	image_xscale = clamp(image_xscale - 0.07, 0, 1);
	image_yscale = clamp(image_yscale - 0.07, 0, 1);
	// center on x, change y for added effect if fell off edge
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	if layer == layer_get_id("lDeath") {
		y = realY + ((1 - image_yscale) * 2 * robotSize);
	} else {
		y = realY + ((1 - image_yscale) * robotSize) / 2;
	}
	// dissapear into darkness
	image_alpha = max(image_alpha - 0.07, 0);
	
	// once the robot can't be seen, restart
	if image_xscale == 0 {
		instance_create_depth(0, 0, 0, oRetryer);
	}
	return;
}

movementTime += 0.05;
var _next_x, _next_y;
var _wait_x, _wait_y;
var _wait = false;
var _x_anim_offs = 0;
var _y_anim_offs = 0;

// evaluate the most recent direction
switch moveDirections[0] {
	case MoveDirection.LEFT:
		_next_x = -sprite_width;
		_next_y = 0;
		image_yscale = eval_move_curve(squashCurveChannelMinor);
		image_xscale = eval_move_curve(squashCurveChannelMajor);
		// center
		_y_anim_offs = ((1 - image_yscale) * robotSize) / 2;
		break;
	case MoveDirection.RIGHT:	
		_next_x = sprite_width;
		_next_y = 0;
		image_yscale = eval_move_curve(squashCurveChannelMinor);
		image_xscale = eval_move_curve(squashCurveChannelMajor);
		_y_anim_offs = ((1 - image_yscale) * robotSize) / 2;
		_x_anim_offs = ((1 - image_xscale) * robotSize);
		break;
	case MoveDirection.UP:
		_next_x = 0;
		_next_y = -sprite_height;
		image_xscale = eval_move_curve(squashCurveChannelMinor);
		image_yscale = eval_move_curve(squashCurveChannelMajor);
		_x_anim_offs += ((1 - image_xscale) * robotSize) / 2;
		break;
	case MoveDirection.DOWN:
		_next_x = 0;
		_next_y = sprite_height;
		image_xscale = eval_move_curve(squashCurveChannelMinor);
		image_yscale = eval_move_curve(squashCurveChannelMajor);
		_x_anim_offs += ((1 - image_xscale) * robotSize) / 2;
		_y_anim_offs += ((1 - image_yscale) * robotSize);
		break;
	case MoveDirection.W_LEFT:
		_wait = true;
		_wait_x = -sprite_width;
		_wait_y = 0;
		break;
	case MoveDirection.W_RIGHT:
		_wait = true;
		_wait_x = sprite_width;
		_wait_y = 0;
		break;
	case MoveDirection.W_UP:
		_wait = true;
		_wait_x = 0;
		_wait_y = -sprite_height;
		break;
	case MoveDirection.W_DOWN:
		_wait = true;
		_wait_x = 0;
		_wait_y = sprite_height;
		break;
	case MoveDirection.NONE:
		// make sure player is in the right place & stop movement timer from ticking up
		reset_real();
		// select the next direction off the top of the stack, or wait for a new one
		if array_length(moveDirections) > 1 {
			array_delete(moveDirections, 0, 1);
		} else if program_done {
			// if we stop and we're not touching the goal, restart
			died = true;
		}
		return;
}

if _wait {
	movementTime = 0;
	switch waitState {
		case WaitState.NOTHING_YET:
			// if we are waiting to see the bug
			
			if place_meeting(realX + _wait_x, realY + _wait_y, oBug) {
				// once we see it, switch state
				waitState = WaitState.BUG_HERE;
			}
			break;
		case WaitState.BUG_HERE:
			// if we are waiting for the bug to go away
			
			if !place_meeting(realX + _wait_x, realY + _wait_y, oBug) {
				// once we see it, reset wait state and ask for another instruction
				waitState = WaitState.NOTHING_YET;
				moveDirections[0] = MoveDirection.NONE;
			}
			break;
	}
	
	return;
}

// stop out of bounds movement
if !is_oob(realX + _next_x, realY + _next_y) {
	// nice movement curve
	var _x_mul = 1;
	var _y_mul = 1;
	if _next_x != 0 {
		_x_mul = eval_move_curve(movementCurveChannel);
	}
	if _next_y != 0 {
		_y_mul = eval_move_curve(movementCurveChannel);
	}
	x = realX + (_next_x * _x_mul) + _x_anim_offs;
	y = realY + (_next_y * _y_mul) + _y_anim_offs;
	// update alpha in case we're behind something now
	update_alpha(realX + _next_x, realY + _next_y);
} else {
	// keep at real positions
	x = realX + _x_anim_offs;
	y = realY + _y_anim_offs;
	
	if movementTime >= 1 {
		reset_real();
	}
}

if movementTime >= 1 {
	// after a movement has been fully completed, reset the timer & wait for a new instruction
	movementTime = 0;
	moveDirections[0] = MoveDirection.NONE;
	// update realX and realY to reflect current position
	realX = x;
	realY = y;
}