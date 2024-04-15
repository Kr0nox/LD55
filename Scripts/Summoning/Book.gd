extends Control
class_name Book

@export var list: RichTextLabel
@export var items: Array[TextureRect]
@export var masks: Array[CanvasItem]
var firstOpened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func render():
	for i in items.size():
		if is_known(i):
			if Game.recipe.items[i] != Lookup.ItemName.NONE:
				items[i].texture = Lookup.imageLookup[Game.recipe.items[i]]
			else:
				items[i].texture = null
		else:
			items[i].texture = Lookup.imageLookup[Lookup.ItemName.NONE]
	
	list.clear()
	for i in Game.recipe.items.size():
		if Game.recipe.items[i] != Lookup.ItemName.NONE && is_known(i):
			list.append_text("- " + Lookup.nameLookup[Game.recipe.items[i]] + "\n")
	
	for i in masks.size():
		masks[i].visible = !Game.learned.has(Game.recipe.drawingParts[i])
		
	if !firstOpened:
		firstOpened = true
		%Dialog.add_all(Lookup.bookOpened)
	

func is_known(index: int):
	if index == 0:
		return Game.learned.has(Game.recipe.drawingParts[3])
	if index == 1:
		return Game.learned.has(Game.recipe.drawingParts[0])
	if index == 2:
		return Game.learned.has(Game.recipe.drawingParts[3]) && Game.learned.has(Game.recipe.drawingParts[2])
	if index == 3:
		return Game.learned.has(Game.recipe.drawingParts[0]) && Game.learned.has(Game.recipe.drawingParts[1])
	if index == 4:
		return Game.learned.has(Game.recipe.drawingParts[2])
	if index == 5:
		return Game.learned.has(Game.recipe.drawingParts[1])
