extends Control
class_name DialogManager

var dialogs: Array[Dialog] =  []
var displayed = 0
@export var nextLabel: Label
@export var label: RichTextLabel
@export var icon: Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	nextLabel.visible = false
	visible = false


# Called every frame. 'delta' is the eelapsed time since the previous frame.
func _process(_delta):
	if dialogs.size() == 0:
		return
	
	if Input.is_action_just_pressed("enter"):
		if displayed < dialogs[0].text.length():
			label.clear()
			label.append_text(dialogs[0].text)
			displayed = dialogs[0].text.length()
			nextLabel.visible = true
		else:
			displayed = 0
			label.clear()
			nextLabel.visible = false
			dialogs.pop_front()
			if dialogs.size() > 0:
				icon.texture = dialogs[0].icon
			else:
				visible = false
			return
	
	if displayed < dialogs[0].text.length():
		label.append_text(dialogs[0].text[displayed])
		displayed += 1
	else:
		nextLabel.visible = true
	

func add_dialog(d: Dialog):
	if dialogs.size() == 0:
		label.clear()
		icon.texture = d.icon
		visible = true
	dialogs.push_back(d)
