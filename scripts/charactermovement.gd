extends Node2D

@export var angular_velocity: float = 3 

func _physics_process(delta):
	rotate(angular_velocity * delta)
	
	
	if Input.is_action_just_pressed("toggle_rotation"):
		angular_velocity *= -1
