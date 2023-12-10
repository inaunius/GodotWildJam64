class_name ActiveGameState
extends GameState

@export var _level_loader : LevelLoader
@export var _loading_ui : FadableUI
@export var _pause_ui : FadableUI


func on_enter(payload=null):
	if _level_loader.get_active_level_name() == GameCycle.MAIN_MENU_LEVEL_NAME:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #TODO: Add separate main menu state
	else: 
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	_loading_ui.ui_visible = false
	_pause_ui.ui_visible = false
	print("ACTIVE GAME")
