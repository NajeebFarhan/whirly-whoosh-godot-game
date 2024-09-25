extends Area2D

func _on_particle_entered(area):
	area.call_deferred("queue_free")
