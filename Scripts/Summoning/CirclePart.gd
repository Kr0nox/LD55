extends Node2D
class_name CirclePart

@export var mask: Node2D
@export var circle: Node2D
@export var isEntered = false
@export var index: int
var drawn = false
var pulseDir = 1
const minAlpha = 0.4
const maxAlpha = 0.8
var a = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	a = a + pulseDir * delta / 10
	if a >= maxAlpha:
		a = maxAlpha
		pulseDir = -1
	elif a <= minAlpha:
		a = minAlpha
		pulseDir = 1
		
	if drawn:
		return
	if !Game.learned.has(Game.recipe.drawingParts[index]):
		return
	
	mask.modulate.a = a
	
	if !isEntered:
		return
		
	if Input.is_action_just_pressed("do"):
		drawn = true
		mask.modulate.a = 0
		circle.check()
	


func _on_body_entered(body):
	if body.name == "Player":
		isEntered = true

func _on_body_exited(body):
	if body.name == "Player":
		isEntered = false

func reset():
	mask.modulate.r = 255
	mask.modulate.g = 125
	mask.modulate.b = 0
	mask.modulate.a = 1
	drawn = false
