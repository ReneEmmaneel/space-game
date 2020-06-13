extends Control

onready var deathLabel = get_node("Deaths")

func set_label():
	var deaths = Global.speedrun_best_deaths
	if deaths == null:
		deathLabel.text = "-"
	else:
		deathLabel.text = str(Global.speedrun_best_deaths)

func _ready():
	set_label()
