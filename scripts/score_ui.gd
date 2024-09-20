extends Label

@onready var game_manager = %GameManager

func _process(_delta):
	position = Vector2(-get_viewport().size.x / 2 + 20 , -get_viewport().size.y / 2 + 20)
	text = "Score " + str(game_manager.get_score())
