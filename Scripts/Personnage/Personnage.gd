extends KinematicBody2D

export (int) var speed = 150

var velocity = Vector2()

var action = false
var animationNom = ""
var doubleAnimation = false


func _physics_process(delta):
	action = false
	doubleAnimation = false
	get_input()
	animate()
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)


# obtenir les entrées du clavier de l'utilisateur
# appele les methodes relié à l'entrer
func get_input():
	velocity = Vector2()
	
	# pour eviter un glitch de changement d'animation (Lorsque que deux animations en même temp)
	if ((Input.is_action_pressed("right") || Input.is_action_pressed("left")) 
	&& (Input.is_action_pressed("up") || Input.is_action_pressed("down"))):
		doubleAnimation = true

	if Input.is_action_pressed("right"):
		droite()
	if Input.is_action_pressed("left"):
		gauche()
	if Input.is_action_pressed("down"):
		bas()
	if Input.is_action_pressed("up"):
		haut()	
	
# ========================== direction ===================================
func droite():
	velocity.x += 1
	if !doubleAnimation:
		animationNom = "Droite"
	action = true
	
func gauche():
	velocity.x -= 1
	if !doubleAnimation: 		
		animationNom = "Gauche"
	action = true
	
func bas():	
	velocity.y += 1
	animationNom = "Bas"
	action = true
	
func haut():
	velocity.y -= 1
	animationNom = "Haut"
	action = true

# ========================== direction fin ===================================
	
# ========================== animation du joueur ===================================	
func animate():
	if (action):
		$MouvementAnimation.animation = animationNom
		$MouvementAnimation.playing = true
		return
	$MouvementAnimation.animation = animationNom	
	$MouvementAnimation.playing = false
