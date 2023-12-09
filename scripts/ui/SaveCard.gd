class_name SaveCard
extends PanelContainer

signal load_save_request(SaveCard)
signal delete_save_request(SaveCard)


@export var _save_name_label : Label
@export var _load_button : Button
@export var _delete_button : Button

var save_name : String : set = _update_save_name


func _ready():
	_load_button.pressed.connect(func(): load_save_request.emit(self))
	_delete_button.pressed.connect(func(): delete_save_request.emit(self))


func _update_save_name(value: String):
	save_name = value
	_save_name_label.text = save_name
