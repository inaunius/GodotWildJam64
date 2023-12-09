class_name GamePause
extends Node


func Pause():
	get_tree().paused = true

func Resume():
	get_tree().paused = false

