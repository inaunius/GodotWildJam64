class_name SettingsSync
extends Control

@export var _volume_adjusters : VolumeAdjusters

func on_select():
	_volume_adjusters.master.value = AudioControl.master_volume
	_volume_adjusters.music.value = AudioControl.music_volume
	_volume_adjusters.sfx.value = AudioControl.sfx_volume
	_volume_adjusters.voice.value = AudioControl.voice_volume
