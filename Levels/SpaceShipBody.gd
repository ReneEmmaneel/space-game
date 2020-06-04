extends KinematicBody2D

var facing
var max_speed = 400
var boost = false
var boost_mult = 10
var fuel = 100
var fuel_per_sec = 25

var direction_movement = Vector2(0,0)
var fuelbar

func get_mouse_position():
	var mouse_pos = get_global_mouse_position()
	return mouse_pos

func _ready():
	facing = get_mouse_position()
	boost = Input.is_action_pressed("mouse_click")
	direction_movement = Vector2(0,0)
	var temp_fuelbar = $"../GUI/FuelBar"
	if temp_fuelbar:
		fuelbar = temp_fuelbar
		fuelbar.max_value = fuel
	$"Explosion_sprite".material.set_shader_param("explode", 1)

func _process(delta):
	$Smoke.emitting = false
	if boost && fuel > 0 && !get_parent().end:
		$Flame.visible = true
		if get_parent().start:
			$Smoke.emitting = true
	else:
		$Flame.visible = false

func _physics_process(delta):
	facing = get_mouse_position()
	if !get_parent().end:
		look_at(facing)

	if get_parent().start && !get_parent().end:
		if boost && fuel > 0:
			var facing_vector = facing - position
			direction_movement += facing_vector.normalized() * boost_mult
			fuel -= fuel_per_sec * delta
			if fuel <= 0:
				fuel = 0
		else:
			direction_movement *= (1 - 0.5 * delta) #50% decrease of speed/second
	
		if direction_movement.length() > max_speed:
			var speed_too_much = direction_movement.length() - max_speed
			fuel += speed_too_much / boost_mult * fuel_per_sec / 2 * delta
			direction_movement = direction_movement.normalized() * max_speed
		var move_delta = direction_movement * delta
		var collided = move_and_collide(move_delta)
		if collided != null:
			if collided.collider.name == "GoalBody":
				$"Animation".play("Win")
				get_parent().end = true
			else:
				$"Animation".play("Explode")
				get_parent().end = true
		if fuelbar:
			fuelbar.value = fuel

	if get_parent().start && !get_parent().end:
		if fuel <= 0 && direction_movement.length() <= 10:
			get_parent().game_lose()

func reset():
	get_parent().game_lose()

func win():
	get_parent().game_win()

func _input(event):
	if Input.is_action_pressed("mouse_click"):
		boost = true
	else:
		boost = false
