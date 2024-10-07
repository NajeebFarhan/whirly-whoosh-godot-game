extends Area2D

@onready var particle = $CPUParticles2D
@onready var sprite = $Sprite2D
var particle_velocity := Vector2(-8, 0)
	
func _physics_process(_delta):
	position += particle_velocity
	
func set_particle_velocity(vel_vector: Vector2):
	particle_velocity = vel_vector


func _on_area_entered(_area):
	call_deferred("queue_free")
	
func _on_body_entered_obstacle(_body):
	GameManager.decrease_health()
	sprite.visible = false
	particle.emitting = true

func _on_body_entered_collectable(_body):
	GameManager.increase_score()
	sprite.visible = false
	particle.emitting = true

func _on_cpu_obstacle_finished():
	call_deferred("queue_free")

func _on_cpu_collectable_finished():
	call_deferred("queue_free")
