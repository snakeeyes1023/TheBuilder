extends KinematicBody2D

var enemie_vitesse = 100
var enemie_point_de_vie = 1
var animation = "Bas"


#intialisation des information de l'enemie par la classe enfant
func _init(_vitesse = 0, _point_de_vie = 0).():
	enemie_vitesse = _vitesse
	enemie_point_de_vie = _point_de_vie


#Fait bouger l'enemie vers le joueur
#Retourne Si une collision avec le personnage est detectée
func mouvement():
	#Obtenir la position du personnage
	var _player = get_tree().get_root().get_node("Jeu/Personnage")
	#Si le personnage existe
	if _player:
		#calcule de la trajectoire à utiliser
		var player_direction = _player.position - self.position
		animate_deplacement(player_direction)
		move_and_slide(enemie_vitesse * player_direction.normalized())	
	
	
#Animation des mouvements de l'enemie
func animate_deplacement(direction):
	if direction.y > 0:
		animation = "Bas"
	if direction.y < 0:
		animation = "Haut"
	#Attribution de l'animation à executer	
	$Animation.animation = animation


#Obtenir les collisions d'un joueur
func obtenir_collision():
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if collision.collider.name == "Personnage":
			return true
		return false
	return null


func hit(degat):
	enemie_point_de_vie -= 1
