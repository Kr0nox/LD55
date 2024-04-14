extends Picker

@export var points: Array[Node2D]
var goal: int
@export var SPEED = 30
@export var anim: AnimatedSprite2D
var rng = RandomNumberGenerator.new()
var dir = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	_next()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	if position.distance_squared_to(points[goal].position) < 10:
		if goal == points.size()-1:
			queue_free()
			return
		_next()
	position += SPEED * delta * dir
	if item == null && goal != points.size()-1:
		goal = points.size()-1
		SPEED *= 3
		_next2()
	

func _next():
	goal = rng.randi_range(0, points.size()-2)
	_next2()
	

func _next2():
	dir = (points[goal].global_position- global_position).normalized()
	look_at(points[goal].position)
