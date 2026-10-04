extends CharacterBody2D
class_name GirthyJohn

var canpress : bool = false
var canpress2 : bool = false
var canpress3 : bool = false
var canpress4 : bool = false
var canpress5 : bool = false
var canpress6 : bool = false
var canpress7 : bool = false
var canpress8 : bool = false

var current_interactible: Interactible

@export var health: int = 100
@export var power: = 1000
@export var powerbar: ProgressBar
@export var healthbar: ProgressBar

func charge(amount: int):
	power = power + amount

func damage(damage: float):
	health -= damage

func _ready():
	powerbar.value = power
	healthbar.value = health

const SPEED = 100.0
#const JUMP_VELOCITY = -400.0

func get_input():
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * SPEED
	if input_dir != Vector2.ZERO:
		power -= 1
		$Node2D.rotation = lerp($Node2D.rotation, atan2(input_dir.y, input_dir.x), 0.5)

func _physics_process(delta):
	if health == 0:
		$"../WinZone/Winlose".game_lost()
	
	if power == 0:
		health -= 5 * delta
		
	
	#if Input.is_action_just_pressed("Interact"):
		#if (canpress == true):
			#$"../Lightbulb/Lightbulb/CollisionShape2D".disabled = true
			#$"../Lightbulb/PointLight2D".enabled = true
			#power -= 1250
			#powerbar.value = power
			#canpress = false
		#if (canpress2 == true):
			#$"../Poweroutlet/PointLight2D".enabled = false
			#$"../Poweroutlet/Poweroutlet/CollisionShape2D".disabled = true
			#power += 2500
			#powerbar.value = power
			#if (power > $CanvasLayer/PowerBar.max_value):
				#power = $CanvasLayer/PowerBar.max_value
			#canpress2 = false
		#if (canpress3 == true):
			#canpress3 = false
			#$"../BatteryPack".hide()
			#$CanvasLayer/PowerBar.max_value = 5000.0
#
	if Input.is_action_just_pressed("toggleflashlight"):
		if ($Node2D/PointLight2D.enabled == true):
			$Node2D/PointLight2D.enabled = false
		else:
			$Node2D/PointLight2D.enabled = true
	if ($Node2D/PointLight2D.enabled == true):
		power -= 1.5 * delta
	else:
		power -= 1 * delta
	powerbar.value = power
	healthbar.value = health
	get_input()
	move_and_slide()

#func _on_lightbulb_area_entered(area):
	#canpress = true
	#powerbar.value = power

#func _on_lightbulb_area_exited(area):
	#canpress = false


func _on_poweroutlet_area_entered(area):
	canpress2 = true
	print("hi")


func _on_poweroutlet_area_exited(area):
	canpress2 = false


func _on_battery_pack_area_entered(area):
	canpress3 = true


func _on_battery_pack_area_exited(area):
	canpress3 = false

func _unhandled_input(event):
	if event.is_action_pressed("Interact") and current_interactible != null:
		print("current_interactible:")
		print(current_interactible)
		current_interactible.interact(self)

func _on_area_entered(body):
	print(body)
	print(body.get_groups())
	if body.get_parent() is Interactible:
		current_interactible = body.get_parent()
		print("press E")
		#body.get_parent().interaction_label.show()
	if body is Enemy:
		#damage()
		pass


func _on_water_area_entered(area):
	$"../Water/PointLight2D".enabled = true
