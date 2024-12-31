setup_level([
	{ msg: "up", block_color: c_red, text_color: c_white, action: function() { array_push(iRobot.moveDirections, iRobot.MoveDirection.UP); } },
	{ msg: "left", block_color: c_red, text_color: c_white, action: function() { array_push(iRobot.moveDirections, iRobot.MoveDirection.LEFT); } },
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(iRobot.moveDirections, iRobot.MoveDirection.RIGHT); } },
]);