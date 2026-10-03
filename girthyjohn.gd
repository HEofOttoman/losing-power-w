extends CharacterBody2D
var canpress : bool = false
@export var health: int = 100
@export var power: int = 100
@export var powerbar: ProgressBar

func charge(amount: int):
	power = power + amount

func _ready():
	powerbar.value = power

const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func get_input():
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * SPEED
	if input_dir != Vector2.ZERO:
		$Node2D.rotation = lerp($Node2D.rotation, atan2(input_dir.y, input_dir.x), 0.5)
	
func _physics_process(_delta):
	if (canpress == true):
		if Input.is_action_just_pressed("Interact"):
			print("interact")
			$"../Lightbulb/Lightbulb/CollisionShape2D".disabled = true
			$"../Lightbulb/PointLight2D".enabled = true
			power -= 25
			powerbar.value = power
			canpress = false
			#$"../Lightbulb".
	get_input()
	move_and_slide()

func _on_lightbulb_area_entered(area):
	canpress = true
