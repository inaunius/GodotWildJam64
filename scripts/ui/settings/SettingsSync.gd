class_name SettingsSync
extends Control

@export var _volume_adjusters : VolumeAdjusters
@export var _screen_options : ScreenOptions

func on_select():
	_volume_adjusters.sync_with_Settings()
	_screen_options.sync_with_Settings()
	
