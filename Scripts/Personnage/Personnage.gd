extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var action = false
var doubleAnimation = false


func _physics_process(delta):
	action = false
	doubleAnimation = false
	get_input()
	animate()
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	
func get_input():
	velocity = Vector2()
	
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
	
func droite():
	velocity.x += 1
	if !doubleAnimation:
		$MouvementAnimation.animation = "Droite"
	action = true
	
func gauche():
	velocity.x -= 1
	if !doubleAnimation: 		
		$MouvementAnimation.animation = "Gauche"
	action = true
	
func bas():	
	velocity.y += 1
	$MouvementAnimation.animation = "Bas"
	action = true
	
func haut():
	velocity.y -= 1
	$MouvementAnimation.animation = "Haut"
	action = true
	
func animate():
	if (action):
		$MouvementAnimation.playing = true
		return
	$MouvementAnimation.playing = false
