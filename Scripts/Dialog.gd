class_name Dialog

@export var icon: Texture2D
@export var text: String
var callback: Callable

func _init(pText: String, pIcon: Texture2D, pCallback = _empty):
	icon = pIcon
	text = pText
	callback = pCallback

func _empty():
	pass
