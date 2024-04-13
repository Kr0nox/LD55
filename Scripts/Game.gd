extends Node

var items: Array[Item] = [null, null, null, null, null, null, null, null, null, null]
var learned: Array[String] = []
var selectedSlot = 0
var recipe = Recipe.new(["1_1", "1_2", "1_3", "1_4"],["","skull", "", "", "", ""])
