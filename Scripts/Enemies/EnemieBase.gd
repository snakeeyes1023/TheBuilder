extends KinematicBody2D

var enemie_vitesse = 100
var enemie_point_de_vie = 1
var animation = "bas"

#intialisation des information de l'enemie par la classe enfant
func _init(_vitesse = 0, _point_de_vie = 0).():
	enemie_vitesse = _vitesse
	enemie_point_de_vie = _point_de_vie


func mouvement():
		#Obtenir la position du personnage
	var _player = get_tree().get_root().get_node("Jeu/Personnage")
	#Si le personnage existe
	if _player:
		#calcule de la trajectoire à utiliser
		var player_direction = _player.position - self.position
		animate(player_direction)
		move_and_slide(enemie_vitesse * player_direction.normalized())

func animate(direction):
	if direction.y > 0:
		animation = "Bas"
	if direction.y < 0:
		animation = "Haut"
	#Attribution de l'animation à executer	
	$Animation.animation = animation

