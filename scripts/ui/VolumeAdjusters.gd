class_name VolumeAdjusters
extends GridContainer

@export var master : Slider
@export var music : Slider
@export var sfx : Slider
@export var voice : Slider


func _ready():
	sync_volume_with_server()
	
	master.changed.connect(func(value: float): AudioControl.set_master_volume(value))
	music.changed.connect(func(value: float): AudioControl.set_music_volume(value))
	sfx.changed.connect(func(value: float): AudioControl.set_sfx_volume(value))
	voice.changed.connect(func(value: float): AudioControl.set_voice_volume(value))


func sync_volume_with_server():
	master.value = AudioControl.master_volume
	music.value = AudioControl.music_volume
	sfx.value = AudioControl.sfx_volume
	voice.value = AudioControl.voice_volume
