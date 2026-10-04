extends Node2D
class_name Interactible

@export var interact_text: String
@export var interaction_label : Label
@export var area : Area2D
@export var enabled: bool # enabled or not

@export var light: PointLight2D

signal interacted(player: Node2D)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#interaction_label.text = interact_text
	#interaction_label.hide()

func toggle_light(yes: bool):
	if yes == true:
		light.show()
		light.enabled = true
		interaction_label.show()
		enabled = true
	else:
		light.hide()
		light.enabled = false
		enabled = false

## Called by the player's interaction component/script
func interact(player: GirthyJohn) -> void:
	interacted.emit(player)
	
