if !on {
	return;
}

draw_set_color(grid_color);

var _height = cells_y * cell_size;

for (var _x = 0; _x < cells_x; ++_x;) {
	var _start_x = x + (_x * cell_size);
	draw_line(_start_x, y, _start_x, y + _height)
}

var _width = cells_x * cell_size;

for (var _y = 0; _y < cells_y; ++_y;) {
	var _start_y = y + (_y * cell_size);
	draw_line(x, _start_y, x + _width, _start_y)
}