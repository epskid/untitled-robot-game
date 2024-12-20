// default to the regular cursor sprite
cursor_sprite = sCursor;

// but if the user is hovering a code block
if one_satisfy(oCodeBlock, function (block) { return block.hovered; }) {
	// then maybe they'll grab it
	cursor_sprite = sGrabMaybe;
}

// and if the user is grabbing one
if one_satisfy(oCodeBlock, function (block) { return block.selected; }) {
	// make it look like they are
	cursor_sprite = sGrab;
}