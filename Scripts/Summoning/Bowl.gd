extends Node2D
class_name Bowl

@export var circle: DrawingCircle
var item: Item
var entered = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == null:
		return
	if item != null:
		return 
	
	if Input.is_action_just_pressed("do"):
		print("do")
		pass
		item = entered.dropOff()
		if item == null:
			return
		item.visible = true
		item.container = self
		item.global_position = self.global_position
		if circle != null:
			circle.check()

func enter(body: Node2D):
	if body.name == "Player":
		entered = body

func exit(body: Node2D):
	if body.name == "Player":
		entered = null
