extends Sprite

var unblocked = load("res://Menu/LevelSelect/MenuImages/speedrunButtonUnblocked.png")
var blocked = load("res://Menu/LevelSelect/MenuImages/speedrunButtonBlocked.png")

func _ready():
	if Global.completed_all_levels():
		texture = unblocked

var hover = false
func _input(event):
	if Rect2(Vector2(0,0), texture.get_size()).has_point(get_local_mouse_position()):
		if Global.completed_all_levels():
			get_parent().set_default_cursor_shape(2)
			hover = true
			if Input.is_action_just_pressed("mouse_click"):
				get_tree().change_scene("res://Menu/SpeedrunMenu/SpeedrunMenu.tscn")
	elif hover == true:
		hover = false
		get_parent().set_default_cursor_shape(0)
