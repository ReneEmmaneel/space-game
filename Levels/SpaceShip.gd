extends Sprite

var facing
var speed = 400
var boost = false
var boost_speed = 800

func _ready():
	facing = get_global_mouse_position()

func _process(delta):
	var vector = facing - position
	var curr_speed
	if boost:
		curr_speed = boost_speed
	else:
		curr_speed = speed
	var move_delta = vector.normalized() * curr_speed * delta
	if move_delta.length() > vector.length():
		pass
	else:
		look_at(facing)
		position += move_delta

func _input(event):
	if event is InputEventMouseMotion:
		facing = event.position
	if Input.is_action_pressed("mouse_click"):
		boost = true
	else:
		boost = false
