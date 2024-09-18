extends Node2D

@onready var obstacles = preload("res://scenes/small_parts/obstacle.tscn")
@onready var collectables = preload("res://scenes/small_parts/collectable.tscn")

@export var particle_velocity: Vector2 = Vector2(-8, 0)

var random: RandomNumberGenerator
var spawn_pos_y = [-160, -80, 0, 80, 160]

func _ready():
	random = RandomNumberGenerator.new() 
	random.randomize()
	
	
func _on_timer_timeout():
	var spawn_pos: Vector2i = Vector2i(random.randi_range(100, 700), spawn_pos_y[random.randi() % len(spawn_pos_y)])
	
	var new_particle
	
	if random.randi() % 100 >= 59:
		new_particle = collectables.instantiate()
	else:
		new_particle = obstacles.instantiate()
	
	new_particle.particle_velocity = particle_velocity
	new_particle.position = spawn_pos
	
	add_child(new_particle)
	
