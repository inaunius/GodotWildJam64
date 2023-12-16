class_name Death
extends Node

func on_death():
	GameCycle.change_state(GlobalEnums.GameStates.DEAD_CHARACTER_STATE)
