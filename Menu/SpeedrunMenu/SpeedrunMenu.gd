extends Control

func _ready():
	if Global.current_mode != Global.Mode.SPEEDRUN:
		activate()
	else:
		deactivate()

var is_active = false
func deactivate():
	is_active = false
	$MainRect.set_visible(false)
	$FinishRect.set_visible(true)

func activate():
	is_active = true
	$MainRect.set_visible(true)
	$FinishRect.set_visible(false)

func continueButtonPressed():
	activate()
	$AnimationPlayer.play("Continue")
