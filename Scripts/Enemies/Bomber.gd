extends "res://Scripts/Enemies/EnemieBase.gd"

export (int) var point_de_vie = 10
export (int) var vitesse = 50
export (int) var frequence_attaque = 500
var derniere_attaque = OS.get_ticks_msec()
var attaque_en_cours = false
var etape_animation = 0

var tour = ["Jeu/Tour", "Jeu/Tour2", "Jeu/towerTest1"]

func _init().(vitesse, point_de_vie, "Jeu/Tour"):
	pass


func _physics_process(delta):
	if attaque_en_cours:
		if !tour_a_porter():
			tour_disparu()
		else:
			attaquer()
		return
	#Déplacement du personnage lorsque qu'aucune attaque est en cours
	recherche_tour()


func recherche_tour():
	self.mouvement()
	$Explosion.playing = false
	$Explosion.visible = false
	
	if !self.cible_en_poursuite:
		print("nouvelle cible")
		self.cible = tour[randi() % tour.size()]


func attaquer():
	if limite_vitesse_attaque():
		etape_animation += 1
		print("bomber attaque")
		if etape_animation == 9:
			explosion()
		
		if etape_animation >= 10:
			tour_disparu()
			self.mort()



# Fait exploser le monstre et par le fait même éffectue
# des dommages aux tours avoisinantes
func explosion():
	$Explosion.visible = true
	$Explosion.playing = true
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		var nom_opposant = collision.collider.name;
		if nom_opposant == "tour" || nom_opposant == "personnage":
			collision.collider.hit(20)


#limite la fréquence de tire du vaisseau	
func limite_vitesse_attaque():
	var difference_temp = OS.get_ticks_msec() - derniere_attaque
	if difference_temp <= frequence_attaque:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true	


func _on_DistanceAttaque_body_shape_entered(body_id, body, body_shape, local_shape):
	attaque_en_cours = true
	self.animation_en_cours = false
	print("bomber attaque en cours")


func tour_disparu():
	etape_animation = 0
	attaque_en_cours = false
	self.animation_en_cours = true


func tour_a_porter():
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if collision.collider.name == "tour":
			return true
	return false
