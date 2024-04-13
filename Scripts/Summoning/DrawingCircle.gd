extends Node
class_name DrawingCircle

@export var bowls: Array[Bowl]
var drawnParts = 0
var collectedItems = 0


func add_item():
	collectedItems += 1

func add_draw():
	drawnParts += 1
	
func check():
	if drawnParts < Game.recipe.drawingParts.size():
		return
	for i in bowls.size():
		if bowls[i].item == null:
			if Game.recipe.items[i] != "":
				return
		elif bowls[i].item.itemName != Game.recipe.items[i]:
			return
			
	#TODO: Summon
	print("SUMMON")
	pass
