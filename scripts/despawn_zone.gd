extends Area2D

func _on_particle_entered(area):
	print("particle destroyed") # debug line
	area.queue_free()
