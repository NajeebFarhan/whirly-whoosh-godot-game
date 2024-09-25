extends Button

func _on_pressed():
	GameManager.score = 0
	GameManager.health = GameManager.default_health
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
