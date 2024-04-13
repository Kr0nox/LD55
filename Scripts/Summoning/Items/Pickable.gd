extends Node2D
class_name Pickable

var entered = null
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	find_child("Sprite2D").texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if entered == null:
		return
	if Input.is_action_just_pressed("do"):
		if pickup(entered):
			visible = false
			set_process(false)

func pickup(_body: Node2D):
	pass

func enter(body: Node2D):
	entered = body
	
func exit(_body: Node2D):
	entered = null
