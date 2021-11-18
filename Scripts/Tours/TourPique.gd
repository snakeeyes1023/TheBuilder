extends Node2D

export var degat = 5
export var point_de_vie = 10

func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit(degat)
	
func hit(degat):
	point_de_vie -= degat
	if point_de_vie <= 0:
		destruction()
		
func destruction():
	queue_free()
