extends Control
class_name SceneController

@export var anim: AnimationPlayer
var c: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func to(name: String):
	anim.play("Fade")
	c = name

func change(_n: StringName):
	if c != "":
		get_tree().change_scene_to_file(c)
