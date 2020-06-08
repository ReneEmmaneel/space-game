extends Sprite

func _input(event):
	if Input.is_action_pressed("mouse_click"):
		var pos = get_local_mouse_position()
		if pos.x > 0 && pos.y > 0 && pos.x < texture.get_size().x && pos.y < texture.get_size().y:
			get_tree().change_scene("res://Menu/LevelSelect.tscn")

func _ready():
	pass # Replace with function body.
