extends Area2D

var particle_velocity = Vector2(-8, 0)

func _physics_process(_delta):
	position += particle_velocity
	
func set_particle_velocity(vel_vector: Vector2):
	particle_velocity = vel_vector

func _on_body_entered_obstacle(_body):
	print("obstacle collided") # debug line
	queue_free()

func _on_body_entered_collectable(_body):
	print("collectable collided") # debug line
	queue_free()
