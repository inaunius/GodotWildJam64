class_name MainMenuButtons
extends Node


const NEW_GAME_LEVEL = "TESTLevel"

@export var _new_game : Button
@export var _load_game : Button
@export var _settings : Button
@export var _quit : Button

@export var _sub_container : SubContainer


func _ready():
	_new_game.pressed.connect(func(): GameCycle.load_level(NEW_GAME_LEVEL)) #TODO: Should be replaced with actual new game
	_load_game.pressed.connect(func(): _sub_container.show_submenu("SavesView"))
	_settings.pressed.connect(func(): _sub_container.show_submenu("Settings"))
	_quit.pressed.connect(func(): GameCycle.quit())
