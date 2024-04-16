extends Node2D

var sceneManager: SceneController
# Called when the node enters the scene tree for the first time.
func _ready():
	sceneManager = preload("res://Prefabs/scene_control.tscn").instantiate()
	add_child(sceneManager)


func change_to(name: String):
	sceneManager.to(name)

func start():
	get_tree().change_scene_to_file("res://Scenes/library.tscn")

func end():
	get_tree().current_scene.find_child("Player", true).find_child("Fader", true).find_child("AnimationPlayer", true).play("default")

func to_menu():
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
