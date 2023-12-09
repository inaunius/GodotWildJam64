class_name InputParser
extends Node

var isp : bool = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("crouch"):
		if isp:
			GameCycle.resume()
		else:
			GameCycle.pause()
		isp = !isp
		
	
