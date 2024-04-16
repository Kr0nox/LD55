extends Node2D

@export var curve: Curve
@export var textures: Array[Texture2D]
const width = 22

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	for i in 4:
		_gen_row(i, rng)
	

func _gen_row(index: int, rng: RandomNumberGenerator):
	var count = curve.sample(rng.randf())
	var row = get_child(index)
	var filledFields = []
	for i in width:
		filledFields.push_back(false)
	var fill = 0.0
	var fails = 0
	while (fill/width) < count && fails < 3:
		print(fails)
		var c = false
		var book = textures[rng.randi_range(0, textures.size() - 1)]
		var sprite = Sprite2D.new()
		sprite.texture = book
		var w = book.get_width()
		var x = rng.randi_range(0, width - w-1)
		for i in w:
			if filledFields[i+x]:
				c = true
				break
		if c:
			fails += 1
			continue
		for i in w:
			filledFields[i+x] = true
		row.add_child(sprite)
		sprite.position.x = x + 1.5
		sprite.position.y = -book.get_height() / 2.0
		fill += w
