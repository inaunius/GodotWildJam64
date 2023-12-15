class_name ObjectPickup
extends Node


signal picked_up(Pickable)
signal put_down


@export var holder : Marker3D
@export var detector : RayCast3D

var _is_button_pressed = false


func _physics_process(delta):
	if _is_button_pressed:
		var object = detector.get_collider() as Pickable
		if object:
			object.position = holder.position


func check_input():
	_is_button_pressed = Input.is_action_pressed("interaction")
