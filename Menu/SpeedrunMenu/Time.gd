extends Control

onready var timeLabel = get_node("Time")

func set_label():
	timeLabel.text = Global.format_time(Global.speedrun_best_time)

func _ready():
	set_label()
