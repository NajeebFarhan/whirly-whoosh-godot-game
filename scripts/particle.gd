extends Area2D

@export var particle_velocity = Vector2(-8, 0)

func _physics_process(delta):
	position += particle_velocity
	

func _on_body_entered_obstacle(body):
	print("obstacle collided")
	queue_free()

func _on_body_entered_collectable(body):
	print("collectable collided")
	queue_free()
