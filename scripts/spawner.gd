extends Node2D

@export var particle_velocity: Vector2 = Vector2(-8, 0)

var obstacles
var collectables

var random: RandomNumberGenerator
var spawn_pos_y = [-100, 0, 100]
var spawn_zone_x = [0, 400]
var collectable_spawn_rate = 60

signal update_score()
signal update_health()

func _ready():
	collectables = preload("res://scenes/entities/collectable.tscn")
	obstacles = preload("res://scenes/entities/obstacle.tscn")
	
	random = RandomNumberGenerator.new() 
	random.randomize()
	
	
func _on_timer_timeout():
	var spawn_pos: Vector2i = Vector2i(random.randi_range(spawn_zone_x[0], spawn_zone_x[1]), spawn_pos_y.pick_random())
	
	var new_particle: Area2D
	
	if random.randi() % 100 + 1 >= collectable_spawn_rate:
		new_particle = collectables.instantiate()
		new_particle.connect("increase_score", _on_collectable_collected)
	else:
		new_particle = obstacles.instantiate()
		new_particle.connect("decrease_health", _on_obstacle_collided)
	
	new_particle.set_particle_velocity(particle_velocity)
	new_particle.position = spawn_pos
	
	add_child(new_particle)
	
func _on_collectable_collected():
	GameManager.increase_score()

func _on_obstacle_collided():
	GameManager.decrease_health()
