extends Pickable

@export var circlePart: CirclePart

func pickup(_body: Node2D):
	print("123")
	circlePart.picked_up()
	return true
