extends Area2D

var entered = null
var firstEnter = false
var img = preload("res://Sprites/fragezeichen stein.png")
var catHintCount = 0
@export var anim: AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	anim.get_animation("default").loop_mode = Animation.LOOP_LINEAR


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !entered:
		return
	
	if Input.is_action_just_pressed("do"):
		add_dialog(next_hint())

func enter(body: Node2D):
	if body.name == "Player":
		entered = body
		if !firstEnter:
			firstEnter = true
			add_dialog("Press E around this pillar to receive hints.")

func exit(body: Node2D):
	if body.name == "Player":
		entered = null

func add_dialog(mes: String):
	entered.add_dialog(Dialog.new(mes, img))

func next_hint():
	if Game.recipeIndex == 0:
		return paimon_hint()
	if Game.recipeIndex == 1:
		return asmodeus_hint()
	if Game.recipeIndex == 2:
		return lilith_hint()
	if Game.recipeIndex == 3:
		return lucifer_hint()

func paimon_hint():
	if !Game.learned.has(Lookup.DrawingName.D11) || !Game.learned.has(Lookup.DrawingName.D12) || !Game.learned.has(Lookup.DrawingName.D13) || !Game.learned.has(Lookup.DrawingName.D14):
		return "Go to the library in the south and collect all pages as (Pick up with E)."
	if !Game.collectedItems.has(Lookup.ItemName.YARROW):
		return "Go to the flower bed in the east and collect a white flower (Pick up with E)."
	if !Game.collectedItems.has(Lookup.ItemName.DIRT):
		return "Get a jar of dirt from a grave in the west (Pick up with E)."
	return "Place the items in the right bowls and draw the circle (By pressing E)."

func asmodeus_hint():
	if !Game.learned.has(Lookup.DrawingName.D21) || !Game.learned.has(Lookup.DrawingName.D22) || !Game.learned.has(Lookup.DrawingName.D23) || !Game.learned.has(Lookup.DrawingName.D24):
		return "Go to the library in the south and collect all pages."
	if !Game.collectedItems.has(Lookup.ItemName.COAL):
		return "Collect coal in the burnt out fireplace north of grave."
	if !Game.collectedItems.has(Lookup.ItemName.VIRGIN):
		return "You killed a virgin near the north wall. Pick up its blood."
	if !Game.collectedItems.has(Lookup.ItemName.SKULL):
		catHintCount += 1
		if catHintCount == 0:
			return "Solve Paimons riddle at the pillars in the south-east."
		elif catHintCount == 1:
			return "What killed the cat?"
		else:
			return "\"Curiosity kills the cat.\""
	return "Place the items in the right bowls and draw the circle."

func lilith_hint():
	if !Game.learned.has(Lookup.DrawingName.D31) || !Game.learned.has(Lookup.DrawingName.D32) || !Game.learned.has(Lookup.DrawingName.D33) || !Game.learned.has(Lookup.DrawingName.D34):
		return "Go to the library in the south and collect all pages."
	if !Game.learned.has(Lookup.ItemName.FEATHER):
		return "Pick a feather from the flying crow (By pressing E)."
	if !Game.collectedItems.has(Lookup.ItemName.LILY):
		return "Pick a red flower from the flower bed in the east."
	if !Game.collectedItems.has(Lookup.ItemName.FOOT):
		return "Try your luck by flipping the lever in the north. (By pressing E)."
	if !Game.collectedItems.has(Lookup.ItemName.SALT):
		return "Look by the fireplace in the west, where you last cooked."
	if !Game.collectedItems.has(Lookup.ItemName.RUBY):
		return "Choose the right rock in the north."
	return "Place the items in the right bowls and draw the circle."
		
func lucifer_hint():
	if !Game.learned.has(Lookup.DrawingName.D41) || !Game.learned.has(Lookup.DrawingName.D42) || !Game.learned.has(Lookup.DrawingName.D43) || !Game.learned.has(Lookup.DrawingName.D44):
		return "Go to the library in the south and collect all pages."
	if !Game.learned.has(Lookup.ItemName.APPLE):
		return "Pick a apple fresh from the tree in the east (By pressing E)."
	if !Game.learned.has(Lookup.ItemName.HORN):
		return "Take a horn from the head in the north."
	if !Game.learned.has(Lookup.ItemName.SKIN):
		return "You sacrificed a snake on the altar yesterday."
	return "Place the items in the right bowls and draw the circle."
