extends Label

func _ready():
	text = "Score " + str(GameManager.score)	
	GameManager.health = GameManager.default_health
	GameManager.score = 0
