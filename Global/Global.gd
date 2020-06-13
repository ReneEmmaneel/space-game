extends Node

enum Mode {CLASSIC, SPEEDRUN}

var current_mode = Mode.CLASSIC
var current_level = 0
var all_levels = []
var levels_beaten = 0
var levels_dir = "res://Levels/Levels/"

var speedrun_time = null
var speedrun_best_time = null
var speedrun_deaths = null
var speedrun_best_deaths = null

var level_select_scene = "res://Menu/LevelSelect/LevelSelect.tscn"
var speedrun_scene = "res://Menu/SpeedrunMenu/SpeedrunMenu.tscn"

#PRELOADING/LOADING LEVELS
func _ready():
	preload_levels()

func preload_levels():
	var file = File.new()
	for i in range(100): #TODO: switch back to sufficiently large number
		var level = str(levels_dir) + "Level" + str(i) + ".tscn"
		if file.file_exists(level):
			all_levels.append(level)

func load_level(level):
	current_level = level
	if level <= levels_beaten + 1 or current_mode == Mode.SPEEDRUN:
		if level <= all_levels.size():
			get_tree().change_scene(all_levels[level - 1])

#CLASSIC MODE LOGIC
#next_level is called when the goal has been reached in a level
func back_to_menu():
	current_mode = Mode.CLASSIC
	get_tree().change_scene(level_select_scene)

func next_level():
	if current_mode == Mode.CLASSIC:
		if current_level == levels_beaten + 1: #beat the last unlocked level
			levels_beaten += 1
		if current_level < all_levels.size():
			load_level(current_level + 1)
		else:
			get_tree().change_scene(level_select_scene)
	elif current_mode == Mode.SPEEDRUN:
		current_level += 1
		if current_level <= all_levels.size():
			load_level(current_level)
		else:
			speedrun_complete()

#SPEEDRUN MODE LOGIC
func start_speedrun():
	current_mode = Mode.SPEEDRUN
	current_level = 1
	speedrun_time = 0
	speedrun_deaths = 0
	load_level(current_level)

func add_level_time(delta):
	if current_mode == Mode.SPEEDRUN:
		speedrun_time += delta

func speedrun_complete():
	get_tree().change_scene(speedrun_scene)

func load_menu():
	current_mode = Mode.CLASSIC
	get_tree().change_scene(level_select_scene)

#MISC
func format_time(time):
	if time == null:
		return "-"
	var format = "%02d:%02d.%02d"
	var string = format % [int(time / 60), fmod(time, 60), int((time - int(time)) * 100)]
	return string
