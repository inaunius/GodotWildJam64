class_name PauseButtons
extends Node

@export var _resume : Button
@export var _load_game : Button
@export var _save_game : Button
@export var _settings : Button
@export var _quit : Button

@export var _sub_container : SubContainer
@export var _ui_root: FadableUI

func _ready():
	_resume.pressed.connect(func(): GameCycle.resume())
	_load_game.pressed.connect(func(): _sub_container.show_submenu("SavesView"))
	_save_game.pressed.connect(func(): GameCycle.save_current_game())
	_settings.pressed.connect(func(): _sub_container.show_submenu("Settings"))
	_quit.pressed.connect(func(): GameCycle.quit())
	
	_ui_root.hidden.connect(func(): _sub_container.hide_all_submenus())
