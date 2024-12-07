/// @description Update Robot

function is_oob(dx, dy) {
	return (dx < -1) || (dx >= room_width) || (dy < 0) || (dy >= room_height);
}

function reset_real() {
	x = realX;
	y = realY;
	movementTime = 0;
	moveDirections[0] = MoveDirection.NONE;
}

if died {
	image_xscale = clamp(image_xscale - 0.07, 0, 1);
	image_yscale = clamp(image_yscale - 0.07, 0, 1);
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * 1.5 * robotSize);
	image_alpha = clamp(image_alpha - 0.07, 0, 1);
	
	if (image_xscale == 0) {
		room_restart();
	}
	return;
} else if tilemap_get_at_pixel(ground, realX + 1, realY) == 0 {
	died = true;
	layer = layer_get_id("lDeath")
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

switch moveDirections[0] {
	case MoveDirection.LEFT:
		if is_oob(realX - sprite_width, realY) {
			reset_real();
			return;
		}
		x = realX - sprite_width * animcurve_channel_evaluate(movementCurveChannel, movementTime);
		y = realY;
		image_yscale = animcurve_channel_evaluate(squashCurveChannelMinor, movementTime);
		image_xscale = animcurve_channel_evaluate(squashCurveChannelMajor, movementTime);
		y += ((1 - image_yscale) * robotSize) / 2;
		break;
	case MoveDirection.RIGHT:
		if is_oob(realX + sprite_width, realY) {
			reset_real();
			return;
		}
		x = realX + sprite_width * animcurve_channel_evaluate(movementCurveChannel, movementTime);
		y = realY;
		image_yscale = animcurve_channel_evaluate(squashCurveChannelMinor, movementTime);
		image_xscale = animcurve_channel_evaluate(squashCurveChannelMajor, movementTime);
		y += ((1 - image_yscale) * robotSize) / 2;
		x += ((1 - image_xscale) * robotSize);
		break;
	case MoveDirection.UP:
		if is_oob(realX, realY - sprite_width) {
			reset_real();
			return;
		}
		x = realX;
		y = realY - sprite_height * animcurve_channel_evaluate(movementCurveChannel, movementTime);
		image_xscale = animcurve_channel_evaluate(squashCurveChannelMinor, movementTime);
		image_yscale = animcurve_channel_evaluate(squashCurveChannelMajor, movementTime);
		x += ((1 - image_xscale) * robotSize) / 2;
		break;
	case MoveDirection.DOWN:
		if is_oob(realX, realY + sprite_width) {
			reset_real();
			return;
		}
		x = realX;
		y = realY + sprite_height * animcurve_channel_evaluate(movementCurveChannel, movementTime);
		image_xscale = animcurve_channel_evaluate(squashCurveChannelMinor, movementTime);
		image_yscale = animcurve_channel_evaluate(squashCurveChannelMajor, movementTime);
		x += ((1 - image_xscale) * robotSize) / 2;
		y += ((1 - image_yscale) * robotSize);
		break;
	case MoveDirection.NONE:
		if array_length(moveDirections) > 1 {
			array_delete(moveDirections, 0, 1);
		}
		movementTime = 0;
		x = realX;
		y = realY;
		break;
}

if movementTime >= 1 {
	movementTime = 0;
	moveDirections[0] = MoveDirection.NONE;
	realX = x;
	realY = y;
}