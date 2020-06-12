extends ColorRect

var default_cursor_shape = 0
var current_cursor_shape = 0
func set_cursor_shape(shape):
	current_cursor_shape = shape
	self.set_default_cursor_shape(shape)

func _input(event):
	self.set_default_cursor_shape(current_cursor_shape)
	current_cursor_shape = default_cursor_shape

func _ready():
	pass # Replace with function body.
