extends "res://Scripts/Enemies/EnemieBase.gd"

export (int) var point_de_vie = 10
export (int) var vitesse = 50
export (int) var frequence_attaque = 500
var derniere_attaque = OS.get_ticks_msec()
var attaque_en_cours = false
var etape_animation = 0
var explosion = false
var seconde_explosion = null
var tour = ["niveau/Jeu/TourBase", "niveau/Jeu/TourZone"]

func _init().(vitesse, point_de_vie, "niveau/Jeu/Tour"):
	pass


func _physics_process(delta):
	verifier_disparition()	
	if attaque_en_cours:
		if etape_animation == 9:
			return
		attaquer()
		return
	else:
		verifier_attaque_en_cours()
		self.mouvement()
	#Déplacement du personnage lorsque qu'aucune attaque est en cours
	recherche_tour()


func recherche_tour():
	self.mouvement()
	$Explosion.playing = false
	$Explosion.visible = false
	
	if !self.cible_en_poursuite:
		self.cible = tour[randi() % tour.size()]


func attaquer():
	if limite_vitesse_attaque():
		etape_animation += 1
		if etape_animation == 9:
			explosion()
			explosion = true
			seconde_explosion = OS.get_ticks_msec()


# Fait exploser le monstre
func explosion():
	$Explosion.visible = true
	$Explosion.playing = true
	$SonExplosion.play()
	var tour_attaquer = self.get_current_cible()
	if tour_attaquer.has_method("hit"):
		tour_attaquer.hit(40)



#limite la fréquence de tire du vaisseau	
func limite_vitesse_attaque():
	var difference_temp = OS.get_ticks_msec() - derniere_attaque
	if difference_temp <= frequence_attaque:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true	


func verifier_attaque_en_cours():
	if !self.mouvement_en_cours:
		attaque_en_cours = true


func verifier_disparition():
	if !explosion:
		return
	var difference_temp = OS.get_ticks_msec() - seconde_explosion
	if difference_temp <= 900:
		self.mort()
