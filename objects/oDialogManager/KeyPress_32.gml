// if the dialog is done, ignore advance
if array_length(dialog) == 0 {
	return;
}

// get another dialog line
array_delete(dialog, 0, 1);

// if the dialog is empty now, stop it from drawing
if array_length(dialog) == 0 {
	draw = false;
}