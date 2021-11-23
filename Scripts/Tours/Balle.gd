extends KinematicBody2D
export var speed = 1000
var velocity = Vector2()
export var degat = 2


func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(degat)
			destroy()
		elif "mur" in collision.collider.name:
			destroy()



func destroy():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	destroy()
