extends Node


#var random = RandomNumberGenerator.new()

func _ready():
	#random.randomize()
	pass

func _process(delta):
	#print(random.randi() % 50 + 1)
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
