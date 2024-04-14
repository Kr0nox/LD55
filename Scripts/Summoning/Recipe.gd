class_name Recipe

var drawingParts: Array[Lookup.DrawingName]
var items: Array[Lookup.ItemName]
var deamon: Deamon
var circle: Texture2D

func _init(pDrawingParts: Array[Lookup.DrawingName], pItems: Array[Lookup.ItemName], pDeamon: Deamon, pCircle: Texture2D):
	drawingParts = pDrawingParts
	items = pItems
	deamon = pDeamon
	circle = pCircle
	
