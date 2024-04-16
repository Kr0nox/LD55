extends Control

var i = preload("res://Sprites/fragezeichen stein.png")
@export var dialog: DialogManager
func menu(_n: StringName):
	var d1 = Dialog.new("And so the evil goat walks the earth once again.", i)
	var d = Dialog.new("Thank you for playing. We hope you enjoyed it :)", i)
	d.callback = GlobalSceneManager.to_menu
	dialog.add_dialog(d1)
	dialog.add_dialog(d)
