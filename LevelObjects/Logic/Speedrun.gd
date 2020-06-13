extends Control

func set_labels():
	$Time.text = Global.format_time(Global.speedrun_time)
	$Deaths.text = "Deaths: " + str(Global.speedrun_deaths)

func _process(delta):
	if Global.current_mode == Global.Mode.SPEEDRUN:
		set_labels()

func _ready():
	if Global.current_mode == Global.Mode.SPEEDRUN:
		self.visible = true
		set_labels()
	else:
		self.visible = false
