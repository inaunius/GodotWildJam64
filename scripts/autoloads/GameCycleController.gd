class_name GameCycleController
extends Node

const MAIN_MENU_LEVEL_NAME = "MainMenu"

@onready var _state_machine : GameStateMachine = $/root/Main/GameStateMachine
@onready var _persistent_data : PersistentData = $/root/Main/Services/PersistentData


func load_level(level_name: String, save_name: String = ""):
	_state_machine.change_state(GlobalEnums.GameStates.LOAD_LEVEL_STATE, level_name)
	_state_machine.change_state(GlobalEnums.GameStates.DATA_LOAD_STATE, save_name)
	_state_machine.change_state(GlobalEnums.GameStates.ACTIVE_GAME_STATE)
	

func go_to_main_menu():
	_state_machine.change_state(GlobalEnums.GameStates.LOAD_LEVEL_STATE, MAIN_MENU_LEVEL_NAME)
	_state_machine.change_state(GlobalEnums.GameStates.DATA_LOAD_STATE, "")
	_state_machine.change_state(GlobalEnums.GameStates.ACTIVE_GAME_STATE)

func get_all_saves() -> Array[SavedData]:
	return _persistent_data.get_all_saves()

func save_current_game():
	_persistent_data.save_current_data()

func delete_save(name: String):
	_persistent_data.delete_save(name)

func pause():
	if (_state_machine.get_state_name() != GlobalEnums.GameStates.ACTIVE_GAME_STATE):
		printerr("Can only pause in ActiveGameState")
		return
	
	_state_machine.change_state(GlobalEnums.GameStates.PAUSED_STATE)
	
func resume():
	if (_state_machine.get_state_name() != GlobalEnums.GameStates.PAUSED_STATE):
		printerr("Can only unpause in PausedGameState")
		return
	
	_state_machine.change_state(GlobalEnums.GameStates.ACTIVE_GAME_STATE)
	
	
func quit():
	_state_machine.change_state(GlobalEnums.GameStates.QUITTING_GAME_STATE)
