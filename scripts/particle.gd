extends Area2D

var particle_velocity := Vector2(-8, 0)
	
func _physics_process(_delta):
	position += particle_velocity
	
func set_particle_velocity(vel_vector: Vector2):
	particle_velocity = vel_vector


func _on_area_entered(_area):
	call_deferred("queue_free")
	
func _on_body_entered_obstacle(_body):
	GameManager.decrease_health()
	call_deferred("queue_free")

func _on_body_entered_collectable(_body):
	GameManager.increase_score()
	call_deferred("queue_free")
