class_name Vector2iFields
extends Control


@export var x : LineEdit
@export var y : LineEdit


var allowed_symbols: = "[0-9]"

func _ready():
	x.text_changed.connect(_filter_fields)
	y.text_changed.connect(_filter_fields)


func get_vector2i() -> Vector2i:
	return Vector2i(int(x.text), int(y.text))

func set_values(values: Vector2i):
	x.text = str(values.x)
	y.text = str(values.y)

func _filter_fields():
	var regex = RegEx.new()
	regex.compile(allowed_symbols)
	
	x.text = regex.search(x.text).get_string()
	y.text = regex.search(x.text).get_string()
