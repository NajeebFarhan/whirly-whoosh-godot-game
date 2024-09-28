extends Node2D

var hud: CanvasLayer

func _ready():
	hud = $HUD
	hud.visible = true
