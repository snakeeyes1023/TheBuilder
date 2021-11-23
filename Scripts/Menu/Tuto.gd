extends Control

var dClick = false
var aClick = false
var sClick = false
var wClick = false
var tutoTouchDone = false
var tutoTourPlacerDone = false
var enemieMort = false
var tour = ["Didacticiel/Jeu/TourBase", "Didacticiel/Jeu/TourZone"]
var zombie_liste = ["Didacticiel/Jeu/Tuto/Zombie", "Didacticiel/Jeu/Tuto/Zombie2", "Didacticiel/Jeu/Tuto/Zombie3"]

func _process(delta):
	if !tutoTouchDone:	
		zombie_pause(true)	
		tuto_des_touches()
	if !tutoTourPlacerDone:		
		tuto_des_tours()
		
	verifier_presence_ennemie()
	if enemieMort:
		InformationJeu.reinitialiser_vie()
		get_tree().change_scene("res://Scenes/Menu/MenuChoixDeNiveau.tscn")
		queue_free()


func tuto_des_tours():
	var cible = tour[randi() % tour.size()]
	var tour_trouver = get_tree().get_root().get_node_or_null(cible)	
	
	if tour_trouver != null && tour_trouver:
		tutoTourPlacerDone = true
		$TourExplication.visible = false
		$Panel.visible = false
		zombie_pause(false)


func zombie_pause(val):
	$Zombie.pause = val
	$Zombie2.pause = val
	$Zombie3.pause = val
	$Zombie.modifier_cible("Didacticiel/Jeu/Personnage")
	$Zombie2.modifier_cible("Didacticiel/Jeu/Personnage")
	$Zombie3.modifier_cible("Didacticiel/Jeu/Personnage")

func verifier_presence_ennemie():
	for z in zombie_liste:
		var zombie_trouver = get_tree().get_root().get_node_or_null(z)	
		if zombie_trouver != null:
			return
	enemieMort = true

func tuto_des_touches():
	if Input.is_action_pressed("right"):
		$d.modulate = Color(0.0, 1.0, 0.0, 0.8)
		dClick = true
	if Input.is_action_pressed("left"):
		$a.modulate = Color(0.0, 1.0, 0.0, 0.8)
		aClick = true
	if Input.is_action_pressed("down"):
		$s.modulate = Color(0.0, 1.0, 0.0, 0.8)
		sClick = true
	if Input.is_action_pressed("up"):
		$w.modulate = Color(0.0, 1.0, 0.0, 0.8)
		wClick = true
	if dClick && aClick && sClick && wClick:
		tutoTouchDone = true
		$a.visible = false
		$d.visible = false
		$w.visible = false
		$s.visible = false
		$DeplacementExplication.visible = false
		$TourExplication.visible = true
