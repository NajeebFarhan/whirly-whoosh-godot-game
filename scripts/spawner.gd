extends Node2D

@onready var obstacles = preload("res://scenes/small_parts/obstacle.tscn")
@onready var collectables = preload("res://scenes/small_parts/collectable.tscn")

@export var particle_velocity: Vector2 = Vector2(-8, 0)

var random: RandomNumberGenerator
var spawn_pos_y = [-160, -80, 0, 80, 160]

signal update_score()
signal update_health()

func _ready():
	random = RandomNumberGenerator.new() 
	random.randomize()
	
	
func _on_timer_timeout():
	var spawn_pos: Vector2i = Vector2i(random.randi_range(0, 400), spawn_pos_y.pick_random())
	
	var new_particle
	
	if random.randi() % 100 >= 59:
		new_particle = collectables.instantiate()
		new_particle.connect("increase_score", _on_collectable_collected)
	else:
		new_particle = obstacles.instantiate()
		new_particle.connect("decrease_health", _on_obstacle_collided)
	
	
	new_particle.set_particle_velocity(particle_velocity)
	new_particle.position = spawn_pos
	
	add_child(new_particle)
	
func _on_collectable_collected():
	emit_signal("update_score")

func _on_obstacle_collided():
	emit_signal("update_health")
