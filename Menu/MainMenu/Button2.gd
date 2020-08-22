extends ReferenceRect

export (NodePath) var settings_page
export (NodePath) var settings_page_initial
export (NodePath) var settings_page_confirm
export (NodePath) var control_page

func _input(event):
	if Input.is_action_just_pressed("mouse_click"):
		if Rect2(Vector2(0,0), rect_size).has_point(get_local_mouse_position()):
			if get_parent().get_parent().visible == true:
				get_node(settings_page).visible = true
				get_node(control_page).visible = false
				get_node(settings_page_initial).visible = true
				get_node(settings_page_confirm).visible = false
