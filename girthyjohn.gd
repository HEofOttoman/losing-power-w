extends CharacterBody2D
var canpress : bool = false

const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * SPEED

func _physics_process(_delta):
	if (canpress == true):
		if Input.is_action_just_pressed("Interact"):
			print("Interacted")
	get_input()
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_area_2d_body_entered(body):
	canpress = true
