extends Interactible
@export var bounding_box: CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	super() # Replace with function body.

func interact(player: GirthyJohn) -> void:
	super(player)
	hide()
	bounding_box.disabled = true
