extends AnimatedSprite2D
class_name Deamon

var dialog: Array[Dialog]
var reward: Item
var callback = func (): pass

func _init(pDialog: Array[Dialog], pReward: Item, pSpriteFrames: SpriteFrames):
	set_sprite_frames(pSpriteFrames)
	dialog = pDialog
	reward = pReward

# Called when the node enters the scene tree for the first time.
func _ready():
	dialog.back().callback = spawn_reward
	var player = get_tree().current_scene.find_child("Player")
	for d in dialog:
		player.add_dialog(d)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_reward():
	if reward != null:
		var item = preload("res://Prefabs/Item.tscn").instantiate()
		item.itemName = reward.itemName
		get_tree().current_scene.add_child(item)
		item.global_position.x = 0
		item.global_position.y = 0
	callback.call()
	queue_free()
