extends Node2D

@export var lights: Array[Node2D]
@export var item: Item
@export var pillar: Bowl
@export var anim: AnimatedSprite2D
var entered = false
var rng = RandomNumberGenerator.new()
var firstTry = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pillar.set_process(false)
	item.set_process(false)
	item.visible = false
	while gen():
		continue


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !entered:
		return
		
	if anim.is_playing():
		return
	
	if Input.is_action_just_pressed("do"):
		anim.play("flip")
		if firstTry:
			while gen():
				continue
			firstTry = false
		else:
			if gen():
				item.visible = true
				item.set_process(true)
				pillar.set_process(true)
				set_process(false)
			



func _on_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_body_exited(body):
	if body.name == "Player":
		entered = false

func gen():
	var iss = []
	for l in lights:
		var i = rng.randi_range(0,2)
		iss.push_back(i)
		l.modulate.r = 152.0/255 if i == 0 else 31.0/255
		l.modulate.g = 152.0/255 if i == 1 else 31.0/255
		l.modulate.b = 152.0/255 if i == 2 else 31.0/255
	
	return iss[0] == iss[1] && iss[1] == iss[2]
