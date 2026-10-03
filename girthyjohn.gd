extends CharacterBody2D
var canpress : bool = false
var canpress2 : bool = false
var canpress3 : bool = false
var canpress4 : bool = false
var canpress5 : bool = false
var canpress6 : bool = false
var canpress7 : bool = false
var canpress8 : bool = false

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
		power -= 1
		powerbar.value = power
		$Node2D.rotation = lerp($Node2D.rotation, atan2(input_dir.y, input_dir.x), 0.5)
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("Interact"):
		if (canpress == true):
			$"../Lightbulb/Lightbulb/CollisionShape2D".disabled = true
			$"../Lightbulb/PointLight2D".enabled = true
			power -= 25
			powerbar.value = power
			canpress = false
		if (canpress2 == true):
			$"../Poweroutlet/PointLight2D".enabled = false
			$"../Poweroutlet/Poweroutlet/CollisionShape2D".disabled = true
			power += 50
			powerbar.value = power
			canpress2 = false
	get_input()
	move_and_slide()

func _on_lightbulb_area_entered(area):
	canpress = true


func _on_lightbulb_area_exited(area):
	canpress = false


func _on_poweroutlet_area_entered(area):
	canpress2 = true


func _on_poweroutlet_area_exited(area):
	canpress2 = false
