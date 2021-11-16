extends Node2D

export var degat = 3

func _physics_process(_delta):
	$Lazer.rotation += 0.05



func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit(degat)


