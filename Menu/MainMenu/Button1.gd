extends ReferenceRect

func _input(event):
	if Input.is_action_just_pressed("mouse_click"):
		if Rect2(Vector2(0,0), rect_size).has_point(get_local_mouse_position()):
			if get_parent().get_parent().visible == true:
				get_tree().change_scene("res://Menu/LevelSelect/LevelSelect.tscn")
