class_name DataLoadState
extends GameState

@export var _persistent_data : PersistentData
@export var _level_load_ui : FadableUI

func on_enter(payload=""):
	print("LOADING DATA")
	_level_load_ui.ui_visible = true
