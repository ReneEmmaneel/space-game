extends Node2D

export(PackedScene) var object_to_spawn
export(float) var time_to_reach = 3
export(float) var time_start = 0
export(float) var scale_object = 1
export(float) var wait_at_end = 1
export(Vector2) var moveTo = Vector2(500, 0)

var object

var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveTo.position = moveTo
	time = time_start
	spawn()
	update_position()

func spawn():
	object = object_to_spawn.instance()
	object.scale = Vector2(scale_object, scale_object)
	self.add_child(object)

func update_position():
	var rem_time = fmod(time, (2 * time_to_reach + 2 * wait_at_end))
	if rem_time > time_to_reach && rem_time <= time_to_reach + wait_at_end:
		rem_time = time_to_reach
	elif rem_time > time_to_reach + wait_at_end && rem_time <= time_to_reach * 2 + wait_at_end:
		rem_time -= wait_at_end
		rem_time = 2 * time_to_reach - rem_time
	elif rem_time > time_to_reach * 2 + wait_at_end:
		rem_time = 0
	var progress = rem_time / time_to_reach
	object.position = $MoveTo.position * progress

func _process(delta):
	time += delta
	update_position()
