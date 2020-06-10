extends StaticBody2D

var destroyed

func _ready():
	pass # Replace with function body.

func destroy():
	destroyed = true
	$AnimationPlayer.play("delete")
