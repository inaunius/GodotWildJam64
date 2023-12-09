class_name PauseButtons
extends Node

@export var _resume : Button
@export var _load_game : Button
@export var _save_game : Button
@export var _settings : Button
@export var _quit : Button

func _ready():
	_resume.pressed.connect(func(): GameCycle.resume())
	_load_game #add loading screeen
	_save_game.pressed.connect(func(): GameCycle.save_current_game())
	_settings #add settings screen
	_quit.pressed.connect(func(): GameCycle.quit())
