extends Node2D
class_name CirclePart

@export var sprite: Sprite2D
@export var circle: Node2D
@export var isEntered = false
@export var pickedUp = false
var pulseDir = 1
const minAlpha = 0.2
const maxAlpha = 0.6

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.modulate.r = 0
	sprite.modulate.g = 125
	sprite.modulate.b = 255
	sprite.modulate.a = minAlpha
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !pickedUp:
		return
	
	var temp = sprite.modulate.a + pulseDir * delta /3
	print(temp)
	sprite.modulate.a = temp
	if temp >= maxAlpha || temp <= minAlpha:
		pulseDir *= -1
	
	if !isEntered:
		return
		
	if Input.is_action_just_pressed("do"):
		# TODO: notify circle
		sprite.modulate.r = 255
		sprite.modulate.g = 255
		sprite.modulate.b = 255
		sprite.modulate.a = 1
		pulseDir = 0
		pickedUp = false
	


func _on_body_entered(body):
	if body.name == "Player":
		isEntered = true
	
	

func picked_up():
	visible = true
	pickedUp = true


func _on_body_exited(body):
	if body.name == "Player":
		isEntered = false
