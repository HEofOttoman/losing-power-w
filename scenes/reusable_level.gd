extends Node2D

@export var win_lose : WinLoseManager
@export var winzone : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_win_zone_area_entered(area):
	win_lose.game_won()
