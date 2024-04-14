extends Node

var items: Array[Item] = [null, null, null, null, null, null, null, null, null, null]
var learned: Array[Lookup.DrawingName] = []
var selectedSlot = 0
var recipeIndex = 0
var recipe = Lookup.recipes[recipeIndex]
