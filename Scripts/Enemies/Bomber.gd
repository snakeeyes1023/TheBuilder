extends "res://Scripts/Enemies/EnemieBase.gd"
var derniere_position = null
export (int) var point_de_vie = 10
export (int) var vitesse = 50
export (int) var frequence_attaque = 500
var derniere_attaque = OS.get_ticks_msec()
var attaque_en_cours = false
var etape_animation = 0
var tour_a_porter = []
var tour = ["niveau/Jeu/TourBase", "niveau/Jeu/TourZone"]

func _init().(vitesse, point_de_vie, "niveau/Jeu/Tour"):
	pass


func _physics_process(delta):
	self.mouvement()
	#verifier_attaque_en_cours()
	if attaque_en_cours:
		if etape_animation < 9:
			return
		attaquer()
		return
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
		
		if etape_animation >= 10:
			self.mort()



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
	if derniere_position == null:
		derniere_position = get_position()
		
		return
	var actuelle_position = get_position()

	if derniere_position == actuelle_position:
		attaque_en_cours = true
		self.animation_en_cours = false
		return
		
	derniere_position = get_position()

func get_position():
	return position
