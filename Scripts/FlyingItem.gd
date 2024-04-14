extends Node2D

@export var SPEED = 20
@export var RADIUS = 300
@export var START_DEG: float = 0
var deg: float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	deg = START_DEG


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	deg += SPEED * delta / 50
	position.x = sin(deg) * RADIUS
	position.y = cos(deg) * RADIUS
