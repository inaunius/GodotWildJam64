class_name QuittingGameState
extends GameState


func on_enter(payload=null):
	print("QUITTING GAME")
	get_tree().quit()
