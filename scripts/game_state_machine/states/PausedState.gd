class_name PausedState
extends GameState


@export var _game_pause : GamePause
@export var _pause_ui : FadableUI


func on_enter(payload=null):
	print("ENTERED GAME PAUSE")
	_game_pause.Pause()
	_pause_ui.ui_visible = true
	
func on_exit(payload=null):
	print("EXITED GAME PAUSE")
	_game_pause.Resume()
	_pause_ui.ui_visible = false
