extends Control

var dClick = false
var aClick = false
var sClick = false
var wClick = false
var tutoTouchDone = false
var tutoTourPlacerDone = false

var tour = ["Dictatielle/Jeu/TourBase", "Dictatielle/Jeu/TourZone"]

func _process(delta):
	if !tutoTouchDone:		
		tuto_des_touches()
	if !tutoTourPlacerDone:		
		tuto_des_tours()
	else:
		queue_free()

func tuto_des_tours():
	var cible = tour[randi() % tour.size()]
	var tour_trouver = get_tree().get_root().get_node_or_null(cible)	
	
	if tour_trouver != null && tour_trouver:
		tutoTourPlacerDone = true

	
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
		$DepleacementExplication.visible = false
		$TourExplication.visible = true
