if !on {
	// don't draw if it isn't on
	return;
}

draw_set_color(grid_color);

// find the hight of the line for drawing the vertical ones
var _height = cells_y * cell_size;

// draw vertical lines in increments of cell_size, cells_x times
for (var _x = 0; _x < cells_x; ++_x;) {
	// calculate the line's starting x-value
	var _start_x = x + (_x * cell_size);
	draw_line(_start_x, y, _start_x, y + _height)
}

// find the width of the line for drawing the horizontal ones
var _width = cells_x * cell_size;

// draw horizontal lines in increments of cell_size, cells_y times
for (var _y = 0; _y < cells_y; ++_y;) {
	// find the starting y value
	var _start_y = y + (_y * cell_size);
	draw_line(x, _start_y, x + _width, _start_y)
}