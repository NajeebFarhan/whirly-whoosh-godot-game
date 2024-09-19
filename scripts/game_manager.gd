extends Node

var score = 0
var health = 5

func get_score() -> int:
	return score
	
func get_health() -> int:
	return health

func increase_score() -> void:
	score += 1
	
func decrease_health() -> void:
	health -= 1
	
func _process(_body):
	if health <= 0:
		get_tree().reload_current_scene()
