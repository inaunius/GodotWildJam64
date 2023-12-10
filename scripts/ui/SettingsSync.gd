class_name SettingsSync
extends Control

@export var _volume_adjusters : VolumeAdjusters

func on_select():
	_volume_adjusters.sync_volume_with_server()
