extends Control

var start = false
var end = false

func _ready():
	$Animation/AnimationPlayer.play("Start")
	

func _input(event):
	if event.is_action_pressed("ui_reset"):
		get_tree().reload_current_scene()

func start():
	start = true

func game_win():
	print("yeah")
	end = true

func game_lose():
	get_tree().reload_current_scene()
	end = true
