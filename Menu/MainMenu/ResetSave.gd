extends ColorRect

export (Array, NodePath) var visible_pages
export (Array, NodePath) var invisible_pages

func _input(event):
	if Input.is_action_just_pressed("mouse_click"):
		if Rect2(Vector2(0,0), rect_size).has_point(get_local_mouse_position()):
			if get_parent().visible == true:
				for p in visible_pages:
					get_node(p).visible = true
				for p in invisible_pages:
					get_node(p).visible = false


func _on_MusicSlider_value_changed(value):
	pass # Replace with function body.
