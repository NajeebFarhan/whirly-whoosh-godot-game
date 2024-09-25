extends Node

@export var default_health = 3
var score = 0
var health = default_health

func increase_score() -> void:
	score += 1
	
func decrease_health() -> void:
	health -= 1
	if health <= 0:
		#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over.tscn")
