extends Sprite

func _ready():
	pass # Replace with function body.

func _input(event):
	if Rect2(texture.get_size() * -0.5, texture.get_size()).has_point(get_local_mouse_position()):
		get_parent().set_cursor_shape(2)
		if Input.is_action_pressed("mouse_click"):
			Global.start_speedrun()
