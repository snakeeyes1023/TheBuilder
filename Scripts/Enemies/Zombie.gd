extends "res://Scripts/Enemies/EnemieBase.gd"

export (int) var point_de_vie = 3
export (int) var vitesse = 70
export (int) var frequence_attaque = 500
var derniere_attaque = OS.get_ticks_msec()
var pause = false
var cible_personnage = "niveau/Jeu/Personnage"

func _init().(vitesse, point_de_vie, cible_personnage):
	pass
	
	
func _physics_process(_delta):
	if pause:
		return
		
	self.mouvement()
	
	if self.obtenir_collision() == true:
		attaquer_personnage()


func modifier_cible(cible):
	cible_personnage = cible
	self.cible = cible


#limite la fréquence de tire du vaisseau	
func limiter_attaque():
	var differenceTemp = OS.get_ticks_msec() - derniere_attaque
	if differenceTemp <= frequence_attaque:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true


#attaquer le personnage ciblé
func attaquer_personnage():
	if limiter_attaque():
		var _player = get_tree().get_root().get_node(cible_personnage)
		_player.hit(2)	
