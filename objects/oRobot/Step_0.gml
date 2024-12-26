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

// if you're not on the ground, you're dead
if !died && tilemap_get_at_pixel(ground, realX + 1, realY) == 0 {
	died = true;
	// move to a layer behind the ground for added effect on the fall
	layer = layer_get_id("lDeath");
}

if died {
	// scale down at a constant rate while falling
	image_xscale = clamp(image_xscale - 0.07, 0, 1);
	image_yscale = clamp(image_yscale - 0.07, 0, 1);
	// center on x, change y for added effect
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * 2 * robotSize);
	// dissapear into darkness
	image_alpha = max(image_alpha - 0.07, 0);
	
	// once the robot can't be seen, restart
	if image_xscale == 0 {
		instance_create_depth(0, 0, 0, oRetryer);
	}
	return;
}

if keyboard_check_pressed(vk_up) {
	array_push(moveDirections, MoveDirection.UP);
}

if keyboard_check_pressed(vk_left) {
	array_push(moveDirections, MoveDirection.LEFT);
}

if keyboard_check_pressed(vk_right) {
	array_push(moveDirections, MoveDirection.RIGHT);
}

if keyboard_check_pressed(vk_down) {
	array_push(moveDirections, MoveDirection.DOWN);
}

movementTime += 0.05;
var _next_x, _next_y;
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
	case MoveDirection.NONE:
		// make sure player is in the right place & stop movement timer from ticking up
		reset_real();
		// select the next direction off the top of the stack, or wait for a new one
		if array_length(moveDirections) > 1 {
			array_delete(moveDirections, 0, 1);
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