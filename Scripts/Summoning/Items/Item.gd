extends Pickable

class_name Item

func pickup(body: Node2D):
	return body.pickup(self)
