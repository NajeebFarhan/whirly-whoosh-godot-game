extends Button

func _on_pressed():
	GameManager.health = GameManager.default_health
	GameManager.score = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")
