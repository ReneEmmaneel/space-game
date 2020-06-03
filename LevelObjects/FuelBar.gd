extends ProgressBar

export(Color) var color_full
export(Color) var color_empty

func _ready():
	value = max_value
	var color = lerp(color_empty, color_full, get_as_ratio())
	var styleBox = self.get("custom_styles/fg")
	styleBox.bg_color = color

func _on_FuelBar_value_changed(value):
	var color = lerp(color_empty, color_full, get_as_ratio())
	var styleBox = self.get("custom_styles/fg")
	styleBox.bg_color = color
