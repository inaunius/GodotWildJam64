extends CharacterBody3D

@export var _camera : Camera3D
#FIXME: This controller is only for test purposes until actual player controller is done.
const DATA_KEY = "TESTPlayer"

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const  MOUSE_SENSIVITY = 0.003


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func on_save_data() -> TESTPlayerData:
	print("SAVED!")
	var data_to_save = TESTPlayerData.new()
	
	data_to_save.position = position
	data_to_save.rotation = rotation
	data_to_save.camera_rotation = _camera.rotation
	
	return data_to_save
	
func on_load_data(data: Resource):
	print("LOADED!")
	var data_to_load = data as TESTPlayerData
	
	position = data_to_load.position
	rotation = data_to_load.rotation
	_camera.rotation = data_to_load.camera_rotation



func _physics_process(delta):
	if !is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (_camera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var look_around = -event.relative.x
		var nod = event.relative.y
		
		rotate_y(look_around*MOUSE_SENSIVITY)
		_camera.rotate_x(nod*MOUSE_SENSIVITY)
		
		_camera.rotation.x = clamp(_camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
		
		
