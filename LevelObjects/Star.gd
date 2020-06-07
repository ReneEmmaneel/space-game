extends StaticBody2D

var destroyed = false

func destroy():
	destroyed = true
	$AnimationPlayer.play("delete")

func _ready():
	pass
