extends Control

onready var timeLabel = get_node("Time")

func _ready():
	timeLabel.text = Global.format_time(Global.speedrun_time)
	if Global.Mode.SPEEDRUN == Global.current_mode && (Global.speedrun_best_time == null || Global.speedrun_time < Global.speedrun_best_time):
		$IsRecord.visible = true
		Global.speedrun_best_time = Global.speedrun_time
	else:
		$IsRecord.visible = false
