class_name PausedState
extends GameState


@export var _game_pause : GamePause
@export var _pause_ui : FadableUI


func on_enter(payload=null):
	print("ENTERED GAME PAUSE")
	_game_pause.pause()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	_pause_ui.ui_visible = true
	
func on_exit(payload=null):
	print("EXITED GAME PAUSE")
	_game_pause.resume()
	_pause_ui.ui_visible = false
