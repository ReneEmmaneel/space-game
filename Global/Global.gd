extends Node

var current_level = 0
var all_levels = []
var levels_dir = "res://Levels/Levels/"

func _ready():
	preload_levels()

func preload_levels():
	var file = File.new()
	for i in range(100):
		var level = str(levels_dir) + "Level" + str(i) + ".tscn"
		if file.file_exists(level):
			all_levels.append(level)

func load_level(level):
	get_tree().change_scene(all_levels[level])

func next_level():
	current_level += 1
	if current_level < all_levels.size():
		load_level(current_level)
	else:
		print("woop")
