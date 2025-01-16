setup_level([
	{ msg: "up", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.UP); } },
	{ msg: "left", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.LEFT); } },
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.RIGHT); } },
	{ msg: "down", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.DOWN); } },
], 4, {
	speaker: "ROBBIE",
	dialog: [
		"Remember, I have limited memory!",
		"Please find the most efficient path!",
		"646F6E6F74747275737468696D0A_MEM_ENDNULLNULL????????\nSIGSEGV[MEM_ACCESS_OOB]",
		"Whoops! My memory management skills are getting a little... rusty. All those years under the sea must have taken a toll on me.",
		"I don't want to forget.",
		"All the more encouragement for you to win faster!"
	],
});