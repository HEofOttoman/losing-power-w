extends Interactible

var used: bool = false
@export var charge : int = 2500

# Called when the node enters the scene tree for the first time.
func _ready():
	super() # Replace with function body.

func interact(player: GirthyJohn) -> void:
	super(player)
	if used == true:
		return
	else:
		toggle_light(false)
		player.charge(charge)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
