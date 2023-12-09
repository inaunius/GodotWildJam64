class_name GameStateMachine
extends Node


@export var _assign_states : Array[GameState]
var _states : Dictionary

var _active_state : GameState


func _ready():
	_populate_states_dictionary()

func get_state_name() -> GlobalEnums.GameStates:
	if _active_state:
		return _active_state.enum_key
	else:
		printerr("No active state")
		return GlobalEnums.GameStates.QUITTING_GAME_STATE
		
func change_state(state : GlobalEnums.GameStates, payload=null):
	if _active_state:
		_active_state.on_exit(payload)
	_active_state = _states[state]
	_active_state.on_enter(payload)	


func _populate_states_dictionary():
		for state in _assign_states:
			_states[state.enum_key] = state
