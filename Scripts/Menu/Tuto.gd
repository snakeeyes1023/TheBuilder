extends Control

var dClick = false
var aClick = false
var sClick = false
var wClick = false
var tutoTouchDone = false


func _process(delta):
	if !tutoTouchDone:
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
	else:
		print("Regarder si une tour existe pour ensuite enlever le tuto")
