class_name VolumeAdjusters
extends Control

@export var master : Slider
@export var music : Slider
@export var sfx : Slider
@export var voice : Slider


func _ready():	
	master.value_changed.connect(func(value: float): 
		Settings.master_volume = value
		Settings.apply_sound_settings())
	music.value_changed.connect(func(value: float): 
		Settings.music_volume = value
		Settings.apply_sound_settings())
	sfx.value_changed.connect(func(value: float): 
		Settings.sfx_volume = value
		Settings.apply_sound_settings())
	voice.value_changed.connect(func(value: float): 
		Settings.voice_volume = value
		Settings.apply_sound_settings())


func sync_with_Settings():
	master.value = Settings.master_volume
	music.value = Settings.music_volume
	sfx.value = Settings.sfx_volume
	voice.value = Settings.voice_volume
