extends StaticBody3D

@onready var _interactable_area = $InteractableArea

# Called when the node enters the scene tree for the first time.
func _ready():
	_interactable_area.interacted.connect(func(): _change_color())
	randomize()

func _change_color():
	$Mesh.get_active_material(0).albedo_color = Color(randf(), randf(), randf())
