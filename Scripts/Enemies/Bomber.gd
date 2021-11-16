extends "res://Scripts/Enemies/EnemieBase.gd"

export (int) var point_de_vie = 10
export (int) var vitesse = 50
export (int) var frequence_attaque = 500
var derniere_attaque = OS.get_ticks_msec()
var attaque_en_cours = false
var etape_animation = 0
var tour_a_porter = []
var tour = ["Jeu/TourBase", "Jeu/TourZone"]

func _init().(vitesse, point_de_vie, "Jeu/Tour"):
	pass


func _physics_process(delta):
	if attaque_en_cours:
		if len(tour_a_porter) == 0 && etape_animation < 9:
			tour_disparu()
			print("test tour disparu")
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
		print("bomber attaque")
		if etape_animation == 9:
			explosion()
		
		if etape_animation >= 10:
			print("je SUIS MORTTTTTT")
			self.mort()



# Fait exploser le monstre et par le fait même éffectue
# des dommages aux tours avoisinantes
func explosion():
	$Explosion.visible = true
	$Explosion.playing = true
	
	for i in len(tour_a_porter):
		var body = tour_a_porter[i]
		body.get_parent().hit(40)
	attaque_en_cours = true

#limite la fréquence de tire du vaisseau	
func limite_vitesse_attaque():
	var difference_temp = OS.get_ticks_msec() - derniere_attaque
	if difference_temp <= frequence_attaque:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true	


func _on_DistanceAttaque_body_shape_entered(body_id, body, body_shape, local_shape):
	attaque_en_cours = true
	tour_a_porter.append(body)
	self.animation_en_cours = false


func tour_disparu():
	etape_animation = 0
	attaque_en_cours = false
	self.animation_en_cours = true
