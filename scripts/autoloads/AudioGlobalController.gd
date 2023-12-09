class_name AudioGlobalController
extends Node


@onready var _master_bus_index = AudioServer.get_bus_index("Master")
@onready var _music_bus_index = AudioServer.get_bus_index("Music")
@onready var _sfx_bus_index = AudioServer.get_bus_index("SFX")
@onready var _voice_bus_index = AudioServer.get_bus_index("Voice")


var master_volume : float : set = _set_master_volume
var music_volume : float : set = _set_music_volume
var sfx_volume : float : set = _set_sfx_volume
var voice_volume : float : set = _set_voice_volume


func _set_master_volume(volume: float):
	AudioServer.set_bus_volume_db(_master_bus_index, linear_to_db(volume))
	master_volume = volume

func _set_music_volume(volume: float):
	AudioServer.set_bus_volume_db(_music_bus_index, linear_to_db(volume))
	music_volume = volume
	
func _set_sfx_volume(volume: float):
	AudioServer.set_bus_volume_db(_sfx_bus_index, linear_to_db(volume))
	sfx_volume = volume

func _set_voice_volume(volume: float):
	AudioServer.set_bus_volume_db(_voice_bus_index, linear_to_db(volume))
	voice_volume= volume
