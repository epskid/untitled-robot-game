setup_level([
	{ msg: "up", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.UP); } },
	{ msg: "left", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.LEFT); } },
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.RIGHT); } },
], 11, {
	speaker: "ROBBIE",
	dialog: [
		"Now try this!",
		"You can see that there's a pillar blocking some of the path from view. Press 'G' to get a better sense of where everything is.",
	]
});