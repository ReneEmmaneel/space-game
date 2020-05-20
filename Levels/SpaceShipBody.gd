extends KinematicBody2D

var facing
var max_speed = 400
var boost = false
var boost_mult = 10

var direction_movement = Vector2(0,0)

func _ready():
	facing = get_global_mouse_position()
	boost = Input.is_action_pressed("mouse_click")
	direction_movement = Vector2(0,0)

func _process(delta):
	$Smoke.emitting = false
	if boost:
		$Flame.visible = true
		if get_parent().start && !get_parent().end:
			$Smoke.emitting = true
	else:
		$Flame.visible = false

func _physics_process(delta):
	if !get_parent().end:
		look_at(facing)

	if get_parent().start && !get_parent().end:
		if boost:
			var facing_vector = facing - position
			direction_movement += facing_vector.normalized() * boost_mult
		else:
			direction_movement *= (1 - 0.5 * delta) #50% decrease of speed/second
	
		if direction_movement.length() > max_speed:
			direction_movement = direction_movement.normalized() * max_speed
		var move_delta = direction_movement * delta
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
