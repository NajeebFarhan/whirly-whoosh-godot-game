extends Area2D

func _on_particle_entered(area):
	area.queue_free()
