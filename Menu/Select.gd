extends ReferenceRect

export(Texture) var levelSelected
export(Texture) var levelNotSelected
export(Texture) var levelNotAvailable 
export(Font) var font
export(int) var leveltile_width
export(int) var leveltile_height
export(int) var tiles_per_row
export(int) var tiles_per_col

var height_in_between
var width_in_between

func _ready():
	height_in_between = (rect_size.y - tiles_per_col * leveltile_height) / (tiles_per_col - 1)
	width_in_between = (rect_size.x - tiles_per_row * leveltile_width) / (tiles_per_row - 1)

func draw_tile(coordinates, level_id):
	var texture
	if level_id <= Global.levels_beaten + 1:
		texture = levelNotSelected
	else:
		texture = levelNotAvailable

	draw_texture_rect(texture, Rect2(coordinates, Vector2(leveltile_width, leveltile_height)), false)
	var string_size = font.get_string_size(str(level_id))
	var translate_x = (leveltile_width - string_size.x) / 2
	var translate_y = 55 #magic number
	var string_pos = coordinates + Vector2(translate_x, translate_y)
	draw_string(font, string_pos, str(level_id))

func _draw():
	for x in range(tiles_per_row):
		for y in range(tiles_per_col):
			var level_id = y * tiles_per_row + x + 1
			var x_coor = (leveltile_width + width_in_between) * x 
			var y_coor = (leveltile_height + height_in_between) * y 
			draw_tile(Vector2(x_coor, y_coor), level_id)

func get_level_from_coordinates(local_pos):
	if local_pos.x < 0 || local_pos.y < 0 || local_pos.x >= rect_size.x || local_pos.y >= rect_size.y:
		return

	var col = local_pos.x / (leveltile_width + width_in_between)
	var row = local_pos.y / (leveltile_height + height_in_between)
	if col - int(col) <= leveltile_width / (leveltile_width + width_in_between):
		if row - int(row) <= leveltile_height / (leveltile_height + height_in_between):
			return int(int(row) * tiles_per_row + int(col) + 1)	
	return null

func _input(event):
	if Input.is_action_pressed("mouse_click"):
		var level = get_level_from_coordinates(get_local_mouse_position())
		if level:
			Global.load_level(level)

func _process(delta):
	var level = get_level_from_coordinates(get_local_mouse_position())
	var shape = CURSOR_ARROW
	if level:
		if level <= Global.levels_beaten + 1:
			shape = CURSOR_POINTING_HAND
	self.set_default_cursor_shape(shape)
