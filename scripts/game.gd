extends Node2D

var hud_scene
var hud

func _ready():
	hud_scene = preload("res://scenes/hud.tscn")
	hud = hud_scene.instantiate()
	add_child(hud)
