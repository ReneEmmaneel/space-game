extends KinematicBody2D

var facing
var speed = 400
var boost = false
var boost_speed = 800

func _ready():
	facing = get_global_mouse_position()

func _physics_process(delta):
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
		if !get_parent().end:
			look_at(facing)
		if get_parent().start && !get_parent().end:
			var collided = move_and_collide(move_delta)
			if collided != null:
				if collided.collider.name == "GoalBody":
					get_parent().game_win()
				else:
					get_parent().game_lose()

func _input(event):
	if event is InputEventMouseMotion:
		facing = event.position
	if Input.is_action_pressed("mouse_click"):
		boost = true
	else:
		boost = false
