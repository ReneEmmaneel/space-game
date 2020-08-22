extends Sprite

func _ready():
	pass # Replace with function body.

var hover = false
func _input(event):
	if Rect2(Vector2(0,0), texture.get_size()).has_point(get_local_mouse_position()):
		get_parent().set_default_cursor_shape(2)
		hover = true
		if Input.is_action_just_pressed("mouse_click"):
			get_tree().change_scene("res://Menu/MainMenu/MainMenu.tscn")
	elif hover == true:
		hover = false
		get_parent().set_default_cursor_shape(0)
