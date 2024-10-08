extends Node2D

@export var particle_velocity := Vector2(-8, 0)

var obstacles: Resource
var collectables: Resource

var random: RandomNumberGenerator
var spawn_pos_y := [-100, 0, 100]
var spawn_zone_x := [0, 400]
var collectable_spawn_rate := 60

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
	else:
		new_particle = obstacles.instantiate()
	
	new_particle.set_particle_velocity(particle_velocity)
	new_particle.position = spawn_pos
	
	add_child(new_particle)
