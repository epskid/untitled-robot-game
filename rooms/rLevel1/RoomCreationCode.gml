setup_level([
	{ msg: "right", block_color: c_red, text_color: c_white, action: function() { array_push(global.robot.moveDirections, MoveDirection.RIGHT); } },
], 3, {
	speaker: "ROBBIE",
	dialog: [
		"My name is Robbie.",
		"I am trapped inside your computer!",
		"Please help me escape using your skills.",
		"To program me to move right once, drag one `right` block onto the start block.",
		"To start the program, press enter, or the little green play button at the top.",
		"If you want to restart, press escape, or the little red cycle button at the top.",
		"To go back to the menu, press the close button. Please note that your progress will be lost."
	]
});