class_name FadableUI
extends CanvasLayer


signal shown
signal hidden 


@export var _ui_parent : Control
@export var _fade_duration : float

var ui_visible : bool = false : set = _update_visibility 


func _ready():
	hide()
	_ui_parent.modulate.a = 0

func _update_visibility(value: bool):
	if ui_visible == value: return
	
	ui_visible = value
	
	if ui_visible: _show_ui()
	else: _hide_ui()

func _show_ui():
	show()
	_tween_visibility(1)
		
func _hide_ui():
	await(_tween_visibility(0).finished)
	hide()

func _tween_visibility(final_value: float) -> Tween:
	var tween = create_tween()
	tween.tween_property(_ui_parent, "modulate", Color(1,1,1, final_value), _fade_duration).set_trans(Tween.TRANS_QUART)
	return tween
	
	
