extends Node2D

export var degat = 5
export var point_de_vie = 10

#Si quelqu'un va sur les piques, le blesse.
func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit(degat)
	
#Function pour prendre des dégats.
func hit(degat):
	point_de_vie -= degat
	if point_de_vie <= 0:
		destruction()
		
func destruction():
	queue_free()
