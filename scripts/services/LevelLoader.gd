class_name LevelLoader
extends Node


signal loading_finished 


@export var _level_parent : Node
@export var _levels : Array[Level]

var _active_level : Level


func load_level(name: String):
	if _active_level:
		_unload_level()
		
	var level_resource = _get_level_by_name(name) 
	var level_instance = level_resource.scene.instantiate()
	
	_level_parent.add_child(level_instance)
	
	_active_level = level_resource
	loading_finished.emit()

func get_active_level_name() -> String:
	if _active_level:
		return _active_level.name
	else:
		printerr("No level loaded")
		return ""
	
func _unload_level():
	var loaded_level = _level_parent.get_children()
	
	if loaded_level:
		for node in loaded_level:
			node.queue_free()
	else:
		printerr("Nothing to unload!")
		

func _get_level_by_name(name: String) -> Level:
	for level in _levels:
		if level.name == name:
			return level
	
	printerr("Level with the name %s does not exist!" %name)
	return null
