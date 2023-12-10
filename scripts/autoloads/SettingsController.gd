class_name SettingsController
extends Node

@onready var _data_save_load : DataSaveLoad = $/root/Main/Services/DataSaveLoad

@onready var _master_bus_index = AudioServer.get_bus_index("Master")
@onready var _music_bus_index = AudioServer.get_bus_index("Music")
@onready var _sfx_bus_index = AudioServer.get_bus_index("SFX")
@onready var _voice_bus_index = AudioServer.get_bus_index("Voice")

var _sound_data = SoundData.new()
var _video_data = VideoData.new()


var master_volume : float : 
	set(value): _sound_data.master_volume = value
	get: return _sound_data.master_volume
var music_volume : float :
	set(value): _sound_data.music_volume = value
	get: return _sound_data.music_volume
var sfx_volume : float :
	set(value): _sound_data.sfx_volume = value
	get: return _sound_data.sfx_volume
var voice_volume : float :
	set(value): _sound_data.voice_volume = value
	get: return _sound_data.voice_volume

var resolution : Vector2i :
	set(value): _video_data.resolution = value
	get: return _video_data.resolution
var screen_mode : GlobalEnums.ScreenModes :
	set(value): _video_data.screen_mode= value
	get: return _video_data.screen_mode
	
	
func _ready():
	_load_settings()


func apply_sound_settings():
	AudioServer.set_bus_volume_db(_master_bus_index, linear_to_db(master_volume))
	AudioServer.set_bus_volume_db(_music_bus_index, linear_to_db(music_volume))
	AudioServer.set_bus_volume_db(_sfx_bus_index, linear_to_db(sfx_volume))
	AudioServer.set_bus_volume_db(_voice_bus_index, linear_to_db(voice_volume))
	_save_settings()

func sync_sound_settings():
	master_volume = db_to_linear(AudioServer.get_bus_volume_db(_master_bus_index))
	music_volume = db_to_linear(AudioServer.get_bus_volume_db(_music_bus_index))
	sfx_volume = db_to_linear(AudioServer.get_bus_volume_db(_sfx_bus_index))
	voice_volume = db_to_linear(AudioServer.get_bus_volume_db(_voice_bus_index))


func apply_video_settings():
	DisplayServer.window_set_size(resolution)
	
	match screen_mode:
		GlobalEnums.ScreenModes.FULLSCREEN: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		GlobalEnums.ScreenModes.FULLSCREEN_WINDOW: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		GlobalEnums.ScreenModes.WINDOWED: DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	_save_settings()
		
func sync_video_settings():
	resolution = DisplayServer.window_get_size()
	
	match DisplayServer.window_get_mode():
		DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN: screen_mode = GlobalEnums.ScreenModes.FULLSCREEN
		DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN: screen_mode = GlobalEnums.ScreenModes.FULLSCREEN_WINDOW
		DisplayServer.WindowMode.WINDOW_MODE_WINDOWED: screen_mode = GlobalEnums.ScreenModes.WINDOWED
		_: screen_mode = GlobalEnums.ScreenModes.WINDOWED

func _save_settings():
	var settings_data = SettingsData.new()
	settings_data.sound_data = _sound_data
	settings_data.video_data = _video_data
	
	_data_save_load.save_settings(settings_data)

func _load_settings():
	var settings_data = _data_save_load.load_settings()
	
	if !settings_data:
		sync_sound_settings()
		sync_video_settings()
		return
	
	_sound_data = settings_data.sound_data
	_video_data = settings_data.video_data
	
	apply_sound_settings()
	apply_video_settings()
