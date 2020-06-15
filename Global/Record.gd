extends Node

var kongregate = true
var loaded = false

func _ready():
	load_save()
	loaded = true

func save():
	var save_dict = {
		"levels_beaten": Global.levels_beaten,
		"speedrun_time": Global.speedrun_best_time,
		"speedrun_death": Global.speedrun_best_deaths,
		"music": 50,
		"sound": 50
	}
	return save_dict

func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	var save_data = save()
	save_game.store_line(to_json(save_data))
	save_game.close()

func load_save():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return

	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		var node_data = parse_json(save_game.get_line())
		Global.levels_beaten = node_data["levels_beaten"]
		Global.speedrun_best_time = node_data["speedrun_time"]
		Global.speedrun_best_deaths = node_data["speedrun_death"]
