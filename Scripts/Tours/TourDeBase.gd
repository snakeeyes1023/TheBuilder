extends Node2D

export var reloadTime = 0.5
var recharge = false
var Balle = preload("res://Scenes/Tours/Balle.tscn")



func _physics_process(_delta):
	if !recharge && $Canon/RayCast2D.is_colliding() && $Canon/RayCast2D.is_in_group("ennemis"):
		print($Canon/RayCast2D.get_collider().name)
		print( $Canon.rotation)
		shoot()
	else:
		$Canon.rotation += 0.05


func _on_Reload_timeout():
	recharge = false


func shoot():
	var b = Balle.instance()
	b.start($Canon/canon.global_position, $Canon.rotation - 1.57)
	get_parent().add_child(b)
	$SonTir.play()
	recharge = true
	$Reload.start()
	$Reload.set_wait_time(reloadTime)
