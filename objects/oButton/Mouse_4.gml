// don't run the callback when the button is disabled
if !disabled {
	// run the user-provided callback with the scope
	// the scope is needed because anonymous functions can't see the outer scope
	// thanks GML code...
	on_click(scope);
}