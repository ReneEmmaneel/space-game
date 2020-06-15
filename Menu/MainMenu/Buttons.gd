extends VBoxContainer

var buttons
var active_button
var spaceship

func _ready():
	buttons = [$Button1, $Button2, $Button3]
	active_button = $Button1
	spaceship = $"../SpaceShipBody"
	$Button1.grab_focus()
	update_buttons()

func update_buttons():
	spaceship.position.y = active_button.rect_position.y + active_button.rect_size.y / 2 + self.rect_position.y + 4

func _on_Button1_mouse_entered():
	active_button = $Button1
	$Button1.grab_focus()
	update_buttons()

func _on_Button2_mouse_entered():
	active_button = $Button2
	$Button2.grab_focus()
	update_buttons()

func _on_Button3_mouse_entered():
	active_button = $Button3
	$Button3.grab_focus()
	update_buttons()
