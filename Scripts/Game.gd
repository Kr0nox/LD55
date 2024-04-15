extends Node

var items: Array[Item] = [null, null, null, null, null, null, null, null, null, null]
var learned: Array[Lookup.DrawingName] = [Lookup.DrawingName.D12, Lookup.DrawingName.D13]
var selectedSlot = 0
var recipeIndex = 0
var recipe = Lookup.recipes[recipeIndex]

