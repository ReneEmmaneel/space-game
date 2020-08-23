extends HSlider

func _ready():
	pass

func _on_SoundSlider_value_changed(value):
	Sound.set_volume("Sound", value)
