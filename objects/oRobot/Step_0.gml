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

function eval_move_curve(curve) {
	return animcurve_channel_evaluate(curve, movementTime);
}

function update_alpha(newRealX, newRealY) {
	if tilemap_get_at_pixel(overlay, newRealX + 2, newRealY) != 0 {
		image_alpha = max(image_alpha - 0.1, 0.25);
	} else {
		image_alpha = min(image_alpha + 0.1, 1);
	}
}

if !spawned {
	image_xscale = animcurve_channel_evaluate(movementCurveChannel, (30 - alarm[0]) / 30);
	image_yscale = animcurve_channel_evaluate(movementCurveChannel, (30 - alarm[0]) / 30);
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * robotSize) / 2;
	return;
}

if !died && (tilemap_get_at_pixel(ground, realX + 1, realY) == 0) {
	died = true;
	layer = layer_get_id("lDeath")
}

if died {
	image_xscale = clamp(image_xscale - 0.07, 0, 1);
	image_yscale = clamp(image_yscale - 0.07, 0, 1);
	x = realX + ((1 - image_xscale) * robotSize) / 2;
	y = realY + ((1 - image_yscale) * 2 * robotSize);
	image_alpha = clamp(image_alpha - 0.07, 0, 1);
	
	if (image_xscale == 0) {
		room_restart();
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

switch moveDirections[0] {
	case MoveDirection.LEFT:
		if is_oob(realX - sprite_width, realY) {
			reset_real();
			return;
		}
		x = realX - sprite_width * eval_move_curve(movementCurveChannel);
		y = realY;
		image_yscale = eval_move_curve(squashCurveChannelMinor);
		image_xscale = eval_move_curve(squashCurveChannelMajor);
		y += ((1 - image_yscale) * robotSize) / 2;
		update_alpha(realX - sprite_width, realY);
		break;
	case MoveDirection.RIGHT:
		if is_oob(realX + sprite_width, realY) {
			reset_real();
			return;
		}
		x = realX + sprite_width * eval_move_curve(movementCurveChannel);
		y = realY;
		image_yscale = eval_move_curve(squashCurveChannelMinor);
		image_xscale = eval_move_curve(squashCurveChannelMajor);
		y += ((1 - image_yscale) * robotSize) / 2;
		x += ((1 - image_xscale) * robotSize);
		update_alpha(realX + sprite_width, realY);
		break;
	case MoveDirection.UP:
		if is_oob(realX, realY - sprite_height) {
			reset_real();
			return;
		}
		x = realX;
		y = realY - sprite_height * eval_move_curve(movementCurveChannel);
		image_xscale = eval_move_curve(squashCurveChannelMinor);
		image_yscale = eval_move_curve(squashCurveChannelMajor);
		x += ((1 - image_xscale) * robotSize) / 2;
		update_alpha(realX, realY - sprite_height);
		break;
	case MoveDirection.DOWN:
		if is_oob(realX, realY + sprite_height) {
			reset_real();
			return;
		}
		x = realX;
		y = realY + sprite_height * eval_move_curve(movementCurveChannel);
		image_xscale = eval_move_curve(squashCurveChannelMinor);
		image_yscale = eval_move_curve(squashCurveChannelMajor);
		x += ((1 - image_xscale) * robotSize) / 2;
		y += ((1 - image_yscale) * robotSize);
		update_alpha(realX, realY + sprite_width);
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