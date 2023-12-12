class_name SavesView
extends PanelContainer


@export var save_card_scene : PackedScene
@export var save_cards_parent: Control


func on_select():
	update_saves_view()
	
func on_unselect():
	_clear_list()


func update_saves_view():
	_clear_list()
		
	for save in GameCycle.get_all_saves():
		print(save)
		var card_instance = _get_save_card(save)
		save_cards_parent.add_child(card_instance)
		

func load_save(save: SavedData):
	GameCycle.load_level(save.level_name, save.name)

func delete_save(save: SavedData):
	GameCycle.delete_save(save.name)
	update_saves_view()

func _clear_list():
	for child in save_cards_parent.get_children():
		child.queue_free()

func _get_save_card(save: SavedData) -> SaveCard:
	var card = save_card_scene.instantiate() as SaveCard
	card.save = save
	card.saves_view = self
	return card


