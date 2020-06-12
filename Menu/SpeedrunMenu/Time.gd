extends Control

onready var timeLabel = get_node("Time")

func _ready():
	timeLabel.text = Global.format_time(Global.speedrun_best_time)
