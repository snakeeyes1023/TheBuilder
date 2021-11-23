extends Node2D

export var reloadTime = 0.2
var recharge = false
var Balle = preload("res://Scenes/Tours/Balle.tscn")
export var point_de_vie = 10


func _physics_process(_delta):
	#Si quelqu'un se trouve devant le canon(Raycast), Tir.
	if !recharge && $Canon/RayCast2D.is_colliding():
		shoot()
	else:
		$Canon.rotation += 0.05


func _on_Reload_timeout():
	recharge = false

#Tir une balle.
func shoot():
	var b = Balle.instance()
	b.start($Canon/canon.global_position, $Canon.rotation - 1.57)
	get_parent().add_child(b)
	$SonTir.play()
	recharge = true
	$Reload.start()
	$Reload.set_wait_time(reloadTime)

#Function pour prendre des dégats.
func hit(degat):
	point_de_vie -= degat
	if point_de_vie <= 0:
		destruction()
		
func destruction():
	queue_free()		
