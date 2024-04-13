extends Pickable
class_name Item

var container = null
@export var itemName: String

func pickup(body: Node2D):
	var r = body.pickup(self)
	if r && container != null:
		container.item = null
	return r
