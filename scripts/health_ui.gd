extends Label

@onready var game_manager = %GameManager

func _process(_delta):
	position = Vector2(get_viewport().size.x / 2 - 85, -get_viewport().size.y / 2 + 20)
	text = "Health " + str(game_manager.get_health())
