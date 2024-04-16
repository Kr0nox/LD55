extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(preload("res://Prefabs/audio_stream_player.tscn").instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
