class_name InteractionArea
extends Area3D

# Useful for a UI element to display interaction prompt
signal nearest_interactable_changed(interactable: InteractableArea)

var nearest_interactable: InteractableArea

func attempt_interaction():
	if is_instance_valid(nearest_interactable):
		nearest_interactable.emit_signal("interacted")

func _ready():
	pass

func _process(_delta):
	var areas: Array[Area3D] = get_overlapping_areas()
	var shortest_distance: float = INF
	var next_nearest_interactable: InteractableArea = null
	for area in areas:
		var distance: float = area.global_position.distance_to(global_position)
		if distance < shortest_distance:
			shortest_distance = distance
			next_nearest_interactable = area

	if next_nearest_interactable != nearest_interactable:
		nearest_interactable = next_nearest_interactable
		emit_signal("nearest_interactable_changed", nearest_interactable)