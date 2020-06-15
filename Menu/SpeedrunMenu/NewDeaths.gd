extends Control

onready var deathsLabel = get_node("Deaths")

func _ready():
	deathsLabel.text = str(Global.speedrun_deaths)
	if Global.Mode.SPEEDRUN == Global.current_mode && (Global.speedrun_best_deaths == null || Global.speedrun_deaths < Global.speedrun_best_deaths):
		$IsRecord.visible = true
		Global.speedrun_best_deaths = Global.speedrun_deaths
		Record.save_game()
	else:
		$IsRecord.visible = false
