extends Label

var game_manager
func _ready():
	game_manager = get_parent().get_node("%GameManager")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#var s = 0
func _process(_delta):
	#text = str(s)
	#s += 0.1
	text = "Score " + str(game_manager.get_score())	 + " health " + str(game_manager.get_health())
