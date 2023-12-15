extends CharacterBody3D

@export var _camera : Camera3D
#FIXME: This controller is only for test purposes until actual player controller is done.
const DATA_KEY = "TESTPlayer"

@export var speed = 4.0
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

func _ready():
	$Marker3D/InteractionArea.nearest_interactable_changed.connect(func(interactable: InteractableArea): _update_interaction_text(interactable))

func _physics_process(delta):
	if Input.is_action_just_pressed("interaction"):
		print("Interact ipnut pressed")
		$Marker3D/InteractionArea.attempt_interaction()

	if !is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (_camera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
	
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var look_around = -event.relative.x
		var nod = event.relative.y
		
		var y_rotation = rotation.y + look_around*MOUSE_SENSIVITY
		var x_cam_rotation = clamp(_camera.rotation.x - nod*MOUSE_SENSIVITY, deg_to_rad(-90), deg_to_rad(90))
		
		rotation.y = y_rotation
		_camera.rotation.x = x_cam_rotation

func _update_interaction_text(interactable: InteractableArea):
	if is_instance_valid(interactable):
		$InteractionLabel.text = "Interact to %s" % interactable.action
	else:
		$InteractionLabel.text = ""