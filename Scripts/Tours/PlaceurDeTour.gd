extends Node2D

export var price = 200 # le changer aussi dans le menu des tours

var TourDeBase = preload("res://Scenes/Tours/TourDeBase.tscn")

var place_libre = 0 


func _physics_process(_delta):
	#Suit la position de la souris pour où la tour va être placée.
	position = get_global_mouse_position()
	#S'il click droit ne place pas la tour.
	if Input.is_action_just_pressed("click_droit"):
		queue_free()
	#Si la place n'est pas libre, met la couleur en rouge sinon en vert
	if place_libre > 0:
		$towerTest1.modulate = Color(1.0, 0.0, 0.0, 0.5)
	else:
		$towerTest1.modulate = Color(0.0, 1.0, 0.0, 0.5)
	#Quand il click droit créer une tour s'il peut la placé à cette endroit.
	if Input.is_action_just_pressed("click_gauche") and !(place_libre > 0):
		InformationJeu.ajouter_argent(-price)
		queue_free()
		var instance = TourDeBase.instance()
		instance.position = position
		get_parent().add_child(instance)
		TourDeBase.instance()



#signal pour detection de si on peux mettre une tour
func _on_Area2D_area_entered(area):
	if(area.name != "zoneDeDetection" && area.name != "Lazer"):
		place_libre += 1

func _on_Area2D_area_exited(area):
	if(area.name != "zoneDeDetection" && area.name != "Lazer"):
		place_libre -= 1

func _on_Area2D_body_entered(body):
	if !("mur" in body.name):
		place_libre += 1

func _on_Area2D_body_exited(body):
	if !("mur" in body.name):
		place_libre -= 1

