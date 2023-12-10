class_name InputParser
extends Node
#Now merely handles pause. Use Input.get_vector(), Input.is_pressed() etc

@export var _level_loader : LevelLoader

var is_paused : bool = false


func _physics_process(_delta):
	_handle_pause()


func _handle_pause():
	if !Input.is_action_just_pressed("pause"): return
	if _level_loader.get_active_level_name() == GameCycle.MAIN_MENU_LEVEL_NAME : return
	
	if GameCycle.get_current_state() == GlobalEnums.GameStates.PAUSED_STATE:
		GameCycle.resume()
	elif GameCycle.get_current_state() == GlobalEnums.GameStates.ACTIVE_GAME_STATE:
		GameCycle.pause()
	else:
		return
		
	is_paused = !is_paused
