extends CharacterBody2D
class_name Inventory

@export var items: Array[Item]
@export var sprites: Array[Sprite2D]
var selectedSlot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	while items.size() < sprites.size():
		items.push_back(null)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("drop"):
		if items[selectedSlot] != null:
			items[selectedSlot].set_process(true)
			items[selectedSlot].visible = true
			items[selectedSlot].global_position = global_transform.origin
			items[selectedSlot] = null
			redraw()

func pickup(item: Item):
	var i = 0
	while i < items.size():
		if items[i] == null:
			break
		i += 1
	if i == items.size():
		return false
	items[i] = item
	redraw()
	return true
	
func redraw():
	for i in items.size():
		if items[i] == null:
			sprites[i].texture = null
		else:
			sprites[i].texture = items[i].texture
