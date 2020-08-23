extends HSlider

func _ready():
	pass

func _on_MusicSlider_value_changed(value):
	Sound.set_volume("Master", value)
