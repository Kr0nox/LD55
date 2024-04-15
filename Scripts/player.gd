extends Inventory


@export var SPEED = 300.0
@export var BRAKE = 15.0
@export var dialogManager: DialogManager
@export var book: Book
@onready var anim = $AnimatedSprite2D
var lastHor = 0
var lastVer = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	super()
	for i in Lookup.intro:
		add_dialog(i)

func _physics_process(_delta):
	var directionHor = Input.get_axis("move_left", "move_right")
	var directionVer = Input.get_axis("move_up", "move_down")
	if directionHor:
		velocity.x = directionHor * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, BRAKE)
		
	if directionVer:
		velocity.y = directionVer * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, BRAKE)
	if directionVer || directionHor:
		lastHor = directionHor
		lastVer = directionVer
		playAnim("run", directionHor, directionVer)
	else:
		playAnim("idle", lastHor, lastVer)
		
	move_and_slide()

func _process(delta):
	super(delta)
	if Input.is_action_just_pressed("book"):
		book.render()
		book.visible = !book.visible
		

func playAnim(prefix: String, hor: float, ver: float):
	if abs(hor) >= abs(ver):
		if hor > 0:
			#right
			anim.play(prefix + "R")
		else:
			#left
			anim.play(prefix + "L")
	else:
		if ver > 0:
			# down
			anim.play(prefix + "Fwd")
		else:
			#up
			anim.play(prefix + "Bwd")

func add_dialog(d: Dialog):
	dialogManager.add_dialog(d)
