class_name InputParser
extends Node

var is_paused : bool = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("pause"):
		if is_paused:
			GameCycle.resume()
		else:
			GameCycle.pause()
		is_paused = !is_paused
		
		
#Now merely handles pause. Use Input.get_vector(), Input.is_pressed() etc
