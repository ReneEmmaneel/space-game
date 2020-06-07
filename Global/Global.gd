extends Node

var current_level = 0
var all_levels = []
var levels_beaten = 0
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
	current_level = level
	if level <= levels_beaten + 1:
		get_tree().change_scene(all_levels[level - 1])

func next_level():
	if current_level == levels_beaten + 1:
		levels_beaten += 1
	if current_level < all_levels.size():
		load_level(current_level + 1)
	else:
		get_tree().change_scene("res://Menu/LevelSelect.tscn")

func load_menu():
	get_tree().change_scene("res://Menu/LevelSelect.tscn")
