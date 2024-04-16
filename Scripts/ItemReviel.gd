extends Node2D

@export var pai: Array[Node2D]
@export var asm: Array[Node2D]
@export var lil: Array[Node2D]

func _ready():
	ac(pai,false)
	ac(asm,false)
	ac(lil,false)

func ac_pai():
	ac(pai,true)
	
func ac_asm():
	ac(asm,true)
	
func ac_lil():
	ac(lil,true)
	
	
func ac(a: Array[Node2D], val: bool):
	for i in a:
		i.visible = val
		i.set_process(val)
		var c = i.find_children("*", "CollisionShape2D", true)
		for d in c:
			d.disabled = !val

func ac_i():
	if Game.recipeIndex == 1:
		ac_pai()
	if Game.recipeIndex == 2:
		ac_asm()
	if Game.recipeIndex == 3:
		ac_lil()
