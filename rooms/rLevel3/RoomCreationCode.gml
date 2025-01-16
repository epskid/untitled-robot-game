setup_level([
	{ msg: "up", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.UP); } },
	{ msg: "left", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.LEFT); } },
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.RIGHT); } },
], 6);