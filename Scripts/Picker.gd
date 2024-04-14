extends Node2D
class_name Picker

@export var item: Item
var entered = null

# Called when the node enters the scene tree for the first time.
func _ready():
	item.container = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if item == null:
		return
	if entered == null:
		return
	
	if Input.is_action_just_pressed("do"):
		if entered.pickup(item):
			item.visible = false
			item.set_process(false)
			item = null
	
func enter(body: Node2D):
	if body.name == "Player":
		entered = body
	
func exit(body: Node2D):
	if body.name == "Player":
		entered = null
