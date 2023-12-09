class_name LevelLoadState
extends GameState


@export var _level_loader : LevelLoader
@export var _level_load_ui : FadableUI


func on_enter(payload=null):
	print("LOADING LEVEL")
	_level_loader.load_level(payload)
	_level_load_ui.ui_visible = true;
	
