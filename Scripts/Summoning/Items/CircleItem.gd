extends Pickable

@export var id: Lookup.DrawingName
static var pickedUpCount = 0
static var enteredAtLeastOnce = false

func pickup(_body: Node2D):
	Game.learned.push_back(id)
	pickedUpCount += 1
	if pickedUpCount == 2:
		%Player.find_child("Dialog", true).add_all(Lookup.bothPagesPickedUp)
	return true

func enter(body: Node2D):
	super(body)
	if entered != null && !enteredAtLeastOnce:
		enteredAtLeastOnce = true
		%Player.find_child("Dialog", true).add_all(Lookup.pageEntered)
