extends StaticBody3D

@onready var _interactable_area = $InteractableArea

func _ready():
	_interactable_area.interacted.connect(func(): _change_color())
	randomize()

func _change_color():
	$Mesh.get_active_material(0).albedo_color = Color(randf(), randf(), randf())
