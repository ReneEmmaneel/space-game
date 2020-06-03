extends Camera2D

var camera_size = Vector2(1024, 600)

var level_size

func _ready():
	level_size = $"../Walls/Sprite".texture.get_size()

func check_locked_x():
	return camera_size.x == level_size.x

func get_spaceship_position():
	return $"../SpaceShipBody".position

func get_spaceship_facing():
	return $"../SpaceShipBody".facing

func _process(delta):
	if !check_locked_x():
		var center = get_spaceship_position()
		if center.x - camera_size.x / 2 < 0:
			position.x = camera_size.x / 2
		elif center.x + camera_size.x / 2 > level_size.x:
			position.x = level_size.x - camera_size.x / 2
		else:
			position.x = center.x
