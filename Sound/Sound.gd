extends Node

var music_volume = 100
var sound_volume = 100

func _ready():
	$Game_music.play()

#Game music: https://freesound.org/people/UdoPohlmann/sounds/132881/
func set_volume(bus, value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), (value - 100) / 6)
	if music_volume == 0 and value > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(bus), false)
	elif value == 0 and music_volume > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index(bus), true)
	music_volume = value

func _on_Game_music_finished():
	$Game_music.play()
