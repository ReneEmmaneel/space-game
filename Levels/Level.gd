extends Control

var start = false
var end = false

func _ready():
	$Animation/AnimationPlayer.play("Start")

func restart():
	get_tree().reload_current_scene()

func _input(event):
	if event.is_action_pressed("ui_reset"):
		restart()

func start():
	start = true

func game_win():
	print("yeah")
	end = true

func game_lose():
	restart()
	end = true
