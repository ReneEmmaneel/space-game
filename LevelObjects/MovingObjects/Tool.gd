tool
extends Node
export(NodePath) var parent

func _ready():
	if Engine.editor_hint:
		print(parent.object_to_spawn)
