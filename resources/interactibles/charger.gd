extends Interactible

var used: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	super() # Replace with function body.

func interact(player: GirthyJohn) -> void:
	super(player)
	player.power += 2500
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
