extends Node2D
class_name DrawingCircle

@export var bowls: Array[Bowl]
@export var camera: Camera2D
@export var parts: Array[CirclePart]
@export var innerCircle: Sprite2D
var drawnParts = 0

func _ready():
	innerCircle.texture = Game.recipe.circle

func check():
	for p in parts:
		if !p.drawn:
			return
	for i in bowls.size():
		if bowls[i].item == null:
			if Game.recipe.items[i] != Lookup.ItemName.NONE:
				return
		elif bowls[i].item.itemName != Game.recipe.items[i]:
			return
		
	for b in bowls:
		if b.item != null:
			b.item.queue_free()
			b.item = null
	var old = get_viewport().get_camera_2d()
	camera.make_current()
	Game.recipe.deamon.callback = func (): demon_callback(old)
	add_child(Game.recipe.deamon)
	Game.recipe.deamon.play()
	pass

func demon_callback(oldCam: Camera2D):
	oldCam.make_current()
	reset_drawing()
	Game.recipeIndex += 1
	if Game.recipeIndex < 4:
		Game.recipe = Lookup.recipes[Game.recipeIndex]
		innerCircle.texture = Game.recipe.circle
		%ItemReviel.ac_i()
	else:
		innerCircle.texture = null
		GlobalSceneManager.end()

func reset_drawing():
	for p in parts:
		p.reset()



