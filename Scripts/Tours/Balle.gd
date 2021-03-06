extends KinematicBody2D
export var speed = 1000
var velocity = Vector2()
export var degat = 2


#Fonction pour savoir où qu'il va et où il spown au début.
func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	#S'il entre en collision avec quelque chose qui peut prendre des dégâts le blesse et après disparait
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(degat)
		destroy()



func destroy():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	destroy()
