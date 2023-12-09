class_name ActiveGameState
extends GameState


@export var _level_load_ui : FadableUI
@export var _pause_ui : FadableUI


func on_enter(payload=null):
	_level_load_ui.ui_visible = false
	_pause_ui.ui_visible = false
	print("ACTIVE GAME")
