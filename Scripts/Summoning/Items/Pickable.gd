extends Node2D
class_name Pickable

var entered = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if entered == null:
		return
	if Input.is_action_just_pressed("do"):
		ex_pick(entered)

func ex_pick(body: Node2D):
	if pickup(body):
			visible = false
			set_process(false)

func pickup(_body: Node2D):
	pass

func enter(body: Node2D):
	if body.name == "Player":
		entered = body
	
func exit(body: Node2D):
	if body.name == "Player":
		entered = null
