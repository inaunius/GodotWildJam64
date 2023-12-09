class_name SaveCard
extends PanelContainer


@export var _save_name_label : Label
@export var _load_button : Button
@export var _delete_button : Button

var save : SavedData : set = _update_card_view
var saves_view : SavesView

func _ready():
	_load_button.pressed.connect(func(): saves_view.load_save(save))
	_delete_button.pressed.connect(func(): saves_view.delete_save(save)) 


func _update_card_view(value: SavedData):
	save = value
	_save_name_label.text = save.name
