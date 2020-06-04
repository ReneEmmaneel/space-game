extends Node2D

export(PackedScene) var object_to_spawn
export(float) var time_in_between = 1
export(float) var time_to_reach = 3
export(float) var scale_object = 1
export(Vector2) var moveTo = Vector2(500, 0)

var time = 0
var objects = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveTo.position = moveTo
	var init_time = 0
	while init_time <= time_to_reach:
		spawn(init_time)
		init_time += time_in_between
	update_positions(0)

func spawn(time):
	var object = object_to_spawn.instance()
	objects.append([object, time])
	object.scale = Vector2(scale_object, scale_object)
	self.add_child(object)

func update_positions(delta):
	for i in range(objects):
		objects[i][1] += delta
		if objects[i][1] >= time_to_reach:
			objects[i][1].queue_free()
			objects.remove(i)
		else:
			var progress = objects[i][1] / time_to_reach
			objects[i][0].position = $MoveTo.position * progress

func _process(delta):
	time += delta
	if time >= time_in_between:
		time -= time_in_between
		spawn(0)
	update_positions(delta)
