setup_level([
	{ msg: "up 3", block_color: c_maroon, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.UP, MoveDirection.UP, MoveDirection.UP); } },
	{ msg: "left", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.LEFT); } },
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.RIGHT); } },
	{ msg: "down 5", block_color: c_maroon, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.DOWN, MoveDirection.DOWN, MoveDirection.DOWN, MoveDirection.DOWN, MoveDirection.DOWN); } },
	{ msg: "wait up", block_color: c_green, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.W_UP); } },
	{ msg: "wait left", block_color: c_green, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.W_LEFT); } },
	{ msg: "wait right", block_color: c_green, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.W_RIGHT); } },
	{ msg: "wait down", block_color: c_green, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.W_DOWN); } },
], 10, {
	speaker: "ROBBIE",
	dialog: [
		"See that angry guy storming around over there?",
		"That is a bug.",
		"If I touch one of them, they mess up my code and I have to restart.",
		"You might have noticed some fancy new green code blocks in the editor.",
		"They wait until they see a bug, then wait until there's no bug, making sure that I'll have time to get across.",
		"But they can only detect bugs in one direction, so make sure you use the right one.",
		"You might also notice some dark red blocks.",
		"These blocks use something called a 'loop' -- they repeat an instruction a certain amount of times.",
		"Anyways, have fun!"
	],
});