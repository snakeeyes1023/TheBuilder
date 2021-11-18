extends Node2D

export var price = 100 # le changer aussi dans le menu des tours

var TourPique = preload("res://Scenes/Tours/TourPique.tscn")

var place_libre = 0 


func _physics_process(_delta):
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("click_droit"):
		queue_free()
	if place_libre > 0:
		$towerTest1.modulate = Color(1.0, 0.0, 0.0, 0.5)
	else:
		$towerTest1.modulate = Color(0.0, 1.0, 0.0, 0.5)
	if Input.is_action_just_pressed("click_gauche") and !(place_libre > 0):
		InformationJeu.ajouter_argent(-price)
		queue_free()
		var instance = TourPique.instance()
		instance.position = position
		get_parent().add_child(instance)
		TourPique.instance()


func _on_Area2D_area_entered(area):
	if(area.name != "zoneDeDetection" && area.name != "Lazer"):
		place_libre += 1


func _on_Area2D_area_exited(area):
	place_libre -= 1


func _on_Area2D_body_entered(body):
	place_libre += 1


func _on_Area2D_body_exited(body):
	place_libre -= 1
