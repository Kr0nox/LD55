extends Node

@export var neededParts: int
@export var neededItems: int
var drawnParts = 0
var collectedItems = 0

func add_item():
	collectedItems += 1

func add_draw():
	drawnParts += 1
	
func check():
	if drawnParts >= neededParts && collectedItems >= neededItems:
		# TODO: Summon
		pass
