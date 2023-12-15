class_name PhysicsPush
extends Node

@export var body : CharacterBody3D
@export var push_force : float = 0.05

func _physics_process(delta):
	for i in body.get_slide_collision_count():
		var collision = body.get_slide_collision(i)
		var collider = collision.get_collider() as RigidBody3D
		
		if collider:
			collider.apply_central_impulse(-collision.get_normal()*push_force)
		
