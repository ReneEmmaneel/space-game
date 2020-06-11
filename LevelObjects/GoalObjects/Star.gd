extends StaticBody2D

var destroyed = false

func destroy():
	destroyed = true
	$CollisionPolygon2D.disabled = true
	$AnimationPlayer.play("delete")

func _ready():
	pass
