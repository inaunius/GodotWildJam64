class_name ScreenOptions
extends Control


@export var resolution_provider : Vector2iFields
@export var screen_mode_options : OptionButton
@export var apply_button : Button


func _ready():
	apply_button.pressed.connect(_apply)

func sync_with_Settings():
	resolution_provider.set_values(Settings.resolution)
	screen_mode_options.select(int(Settings.screen_mode))


func _apply():
	Settings.resolution = resolution_provider.get_vector2i()
	Settings.screen_mode = screen_mode_options.selected
	Settings.apply_video_settings()
