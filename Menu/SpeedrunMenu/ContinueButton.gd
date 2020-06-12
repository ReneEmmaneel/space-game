extends Sprite

func _input(event):
	var root = get_parent().get_parent()
	if !root.is_active:
		if Rect2(texture.get_size() * -0.5, texture.get_size()).has_point(get_local_mouse_position()):
			get_parent().set_cursor_shape(2)
			if Input.is_action_pressed("mouse_click"):
				root.continueButtonPressed()
