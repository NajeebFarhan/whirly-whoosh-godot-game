extends Button

var restart_button: Button
var quit_button: Button

var paused := false

func _ready():
	restart_button = get_parent().get_node("RestartButton")
	quit_button = get_parent().get_node("QuitButton")
	

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		paused = !paused
		get_tree().paused = paused
	
	if paused:
		text = "Resume(Esc)"
		restart_button.show()
		quit_button.show()
	else:
		text = "Pause(Esc)"
		restart_button.hide()
		quit_button.hide()


func _on_pressed():
	paused = !paused
	get_tree().paused = paused
