class_name DeadCharatcerState
extends GameState


@export var _death_screen : FadableUI
@export var _game_pause : GamePause

func on_enter(payload=null):
	print("DEAD")
	_game_pause.pause()
	_death_screen.show();

func on_exit(payload=null):
	_death_screen.hide();
	_game_pause.resume()
