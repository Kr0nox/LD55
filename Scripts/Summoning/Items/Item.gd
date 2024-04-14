extends Pickable
class_name Item

@export var container: Node2D = null
@export var itemName: Lookup.ItemName

func _init(pName: Lookup.ItemName = itemName):
	itemName = pName

func _ready():
	find_child("Sprite2D").texture = Lookup.imageLookup[itemName]

func pickup(body: Node2D):
	var r = body.pickup(self)
	if r && container != null:
		container.item = null
	return r
