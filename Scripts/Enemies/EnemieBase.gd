extends KinematicBody2D

var enemie_vitesse = 100
var enemie_point_de_vie = 1
var animation = "Bas"
var animation_en_cours = true
var cible = "niveau/Jeu/Personnage"
var cible_en_poursuite = true
var max_point_vie = 0
var mouvement_en_cours = true
#intialisation des information de l'enemie par la classe enfant
func _init(_vitesse = 0, _point_de_vie = 0, _cible = null).():
	enemie_vitesse = _vitesse
	max_point_vie = _point_de_vie
	enemie_point_de_vie = _point_de_vie
	if _cible != null:
		cible = _cible


#Fait bouger l'enemie vers le joueur
#Retourne Si une collision avec le personnage est detectée
func mouvement():
	#Obtenir la position de la cible
	var _player = get_current_cible()
	#Si le personnage existe
	if _player:	
		if animation_en_cours != $Animation.playing:
			$Animation.playing = animation_en_cours
			
		#calcule de la trajectoire à utiliser
		var player_direction = _player.position - self.position
		verifier_mouvement_en_cours(player_direction)
	
		animate_deplacement(player_direction)
		move_and_slide(enemie_vitesse * player_direction.normalized())	
		cible_en_poursuite = true
		
	else:
		cible_en_poursuite = false
	
#Animation des mouvements de l'enemie
func animate_deplacement(direction):
	if direction.y >= 0:
		animation = "Bas"
	else:
		animation = "Haut"
	#Attribution de l'animation à executer	
	$Animation.animation = animation


func verifier_mouvement_en_cours(p):
	if p.x < 50 && p.x > -50:
		 mouvement_en_cours = false
	if p.y < 1 && p.y > -1:
		 mouvement_en_cours = false	


#Obtenir les collisions d'un joueur
func obtenir_collision():
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if collision.collider.name == "Personnage":
			return true
		return false
	return null

#position de départ de l'ennemie
func start(pos):
	self.position = pos
	

func hit(degat):
	enemie_point_de_vie -= degat
	if enemie_point_de_vie <= 0:
		mort()

func mort():
	InformationJeu.ajouter_argent(max_point_vie*15)
	queue_free()

func get_current_cible():
	return get_tree().get_root().get_node(cible)

