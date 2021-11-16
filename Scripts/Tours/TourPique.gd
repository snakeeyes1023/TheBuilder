extends Node2D

export var degat = 5


func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit(degat)
	
