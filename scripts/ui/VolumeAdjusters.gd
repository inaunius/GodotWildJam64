class_name VolumeAdjusters
extends GridContainer

@export var master : Slider
@export var music : Slider
@export var sfx : Slider
@export var voice : Slider


func _ready():
	master.changed.connect(func(value: float): AudioControl.set_master_volume(value))
	music.changed.connect(func(value: float): AudioControl.set_music_volume(value))
	sfx.changed.connect(func(value: float): AudioControl.set_sfx_volume(value))
	voice.changed.connect(func(value: float): AudioControl.set_voice_volume(value))
