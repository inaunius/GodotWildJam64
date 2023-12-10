class_name GameCycleController
extends Node

const MAIN_MENU_LEVEL_NAME = "MainMenu"

@onready var _state_machine : GameStateMachine = $/root/Main/GameStateMachine
@onready var _persistent_data : DataSaveLoad = $/root/Main/Services/DataSaveLoad
@onready var _level_loader : LevelLoader = $/root/Main/Services/LevelLoader


func load_level(level_name: String, save_name: String = ""):
	_state_machine.change_state(GlobalEnums.GameStates.LEVEL_LOAD_STATE, level_name)
	if (save_name):
		_state_machine.change_state(GlobalEnums.GameStates.DATA_LOAD_STATE, save_name)
	_state_machine.change_state(GlobalEnums.GameStates.ACTIVE_GAME_STATE)
	

func get_current_state() -> GlobalEnums.GameStates:
	return _state_machine.get_current_state()

func go_to_main_menu():
	load_level(MAIN_MENU_LEVEL_NAME)

func get_all_saves() -> Array[SavedData]:
	return _persistent_data.get_all_saves()

func save_current_game():
	_persistent_data.save_current_data()

func delete_save(name: String):
	_persistent_data.delete_save(name)

func pause():
	if (_state_machine.get_current_state() != GlobalEnums.GameStates.ACTIVE_GAME_STATE):
		printerr("Can only pause in ActiveGameState")
		return
	if (_level_loader.get_active_level_name() == MAIN_MENU_LEVEL_NAME):
		printerr("Cannot paunse on Main menu level!")
		return
	
	_state_machine.change_state(GlobalEnums.GameStates.PAUSED_STATE)
	
func resume():
	if (_state_machine.get_current_state() != GlobalEnums.GameStates.PAUSED_STATE):
		printerr("Can only unpause in PausedGameState")
		return
	
	_state_machine.change_state(GlobalEnums.GameStates.ACTIVE_GAME_STATE)
	
	
func quit():
	_state_machine.change_state(GlobalEnums.GameStates.QUITTING_GAME_STATE)
