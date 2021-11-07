extends Node2D

export var price = 100 # le changer aussi dans le menu des tours

var placement = true
var place_libre = true 


func _process(_delta):
	if placement:
		position = get_global_mouse_position()
		if Input.is_action_just_pressed("click_droit"):
			queue_free()
		if place_libre:
			$towerTest1.modulate = Color(0.0, 1.0, 0.0, 0.5)
		else:
			$towerTest1.modulate = Color(1.0, 0.0, 0.0, 0.5)
		if Input.is_action_just_pressed("click_gauche") and place_libre:
			placement = false
			get_parent().get_node("Market").changer_argent(-100)
			$towerTest1.modulate = Color(1.0, 1.0, 1.0, 1.0)

