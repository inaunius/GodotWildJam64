class_name SubContainer
extends Control

@export var _sub_menus : Array[Control]

func _ready():
	for menu in _sub_menus:
		menu.hide()


func hide_all_submenus():
	for menu in _sub_menus:
		if menu.has_method("on_unselect"):
			menu.hide()
		menu.hide()
		
func show_submenu(name: String):
	hide_all_submenus()
	var sub_menu = _get_submenu_by_name(name)
	if sub_menu.has_method("on_select"):
		sub_menu.on_select()
		sub_menu.show()

func _get_submenu_by_name(name: String) -> Control:
	for menu in _sub_menus:
		if menu.name == name:
			return menu
			
	printerr("No submenu with the name %s found" %name)
	return null
