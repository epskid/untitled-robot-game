// declare some basic helper functions

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

// twice the speed as the player so that it is likely to catch them
movementTime += 0.1;
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
		// make sure bug is in the right place & stop movement timer from ticking up
		reset_real();
		// select the next direction off the top of the stack, or restart the loop
		if array_length(moveDirections) > 1 {
			array_delete(moveDirections, 0, 1);
		} else {
			// once an iteration of the loop is done, reset moveDirections to the loop
			array_copy(moveDirections, 0, loop, 0, array_length(loop));
		}
		return;
}

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


if movementTime >= 1 {
	// after a movement has been fully completed, reset the timer & wait for a new instruction
	movementTime = 0;
	moveDirections[0] = MoveDirection.NONE;
	// update realX and realY to reflect current position
	realX = x;
	realY = y;
}