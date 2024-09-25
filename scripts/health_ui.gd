extends Label

func _process(_delta):
	text = "Health " + str(GameManager.health)
