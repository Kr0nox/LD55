extends Pickable

@export var id: String

func pickup(_body: Node2D):
	Game.learned.push_back(id)
	return true
