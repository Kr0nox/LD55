extends CharacterBody2D
class_name Inventory

@export var sprites: Array[Sprite2D]
@export var selector: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	redraw()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("next_item"):
		_move_select(-1)
		redraw()
	elif Input.is_action_just_pressed("prev_item"):
		_move_select(1)
		redraw()

func _move_select(dir: int):
	var old = Game.selectedSlot
	while true:
		Game.selectedSlot += dir
		if Game.selectedSlot < 0:
			Game.selectedSlot = sprites.size() - 1
		if Game.selectedSlot >= sprites.size():
			Game.selectedSlot = 0
		if Game.items[Game.selectedSlot] != null:
			return
		if old == Game.selectedSlot:
			return

func pickup(item: Item):
	var i = 0
	while i < Game.items.size():
		if Game.items[i] == null:
			break
		i += 1
	if i == Game.items.size():
		return false
	Game.items[i] = item
	redraw()
	return true
	
func redraw():
	selector.position = sprites[Game.selectedSlot].position
	for i in Game.items.size():
		if Game.items[i] == null:
			sprites[i].texture = null
		else:
			sprites[i].texture = Lookup.imageLookup[Game.items[i].itemName]

func dropOff():
	var item = Game.items[Game.selectedSlot]
	Game.items[Game.selectedSlot] = null
	if item != null:
		item.set_process(true)
	redraw()
	return item
