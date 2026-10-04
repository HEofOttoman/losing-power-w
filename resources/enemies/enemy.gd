extends CharacterBody2D
var alarm
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var ray_cast_2d = $RayCast2D


var movement_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _physics_process(delta: float) -> void:
	var mouse_position = $"../../Player".position
	if not ray_cast_2d.is_colliding():
		navigation_agent_2d.target_position = mouse_position
		var current_agent_postition = global_position
		var next_path_position = navigation_agent_2d.get_next_path_position()
		var new_velocity = current_agent_postition.direction_to(next_path_position)*movement_speed
		if navigation_agent_2d.avoidance_enabled:
			navigation_agent_2d.set_velocity(new_velocity)
		else:
			_on_navigation_agent_2d_velocity_computed(new_velocity)
		move_and_slide()
	ray_cast_2d.target_position = mouse_position


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
