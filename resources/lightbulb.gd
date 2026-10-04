extends Interactible
class_name Lightbulb
#@export var light: PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	enabled = false
	light.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func toggle_light(yes: bool):
	#if yes == true:
		#light.show()
		#light.enabled = true
		#interaction_label.show()
		#enabled = true
	#else:
		#light.hide()
		#light.enabled = false
		#enabled = false

func interact(player: GirthyJohn) -> void:
	super(player)
	player.power -= 1250
	if enabled == true:
		return
	else:
		toggle_light(true)
