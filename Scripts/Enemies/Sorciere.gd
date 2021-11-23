extends "res://Scripts/Enemies/EnemieBase.gd"

export (int) var point_de_vie = 10
export (int) var vitesse = 50
export (int) var frequence_attaque = 6000
export (int) var frequence_apparition = 1000
var zombie = preload("res://Scenes/Enemies/Zombie.tscn")
var derniere_attaque = OS.get_ticks_msec()
var derniere_apparition = OS.get_ticks_msec()
var attaque_en_cours = false
var enemie_apparu = 0

func _init().(vitesse, point_de_vie):
	pass
	
	
func _physics_process(delta):
	if attaque_en_cours:
		attaquer_personnage()
		return
		
	if limiter_attaque():
		self.animation_en_cours = false
		attaque_en_cours = true
		derniere_apparition = OS.get_ticks_msec()
		return
	self.animation_en_cours = true
	#Déplacement du personnage lorsque qu'aucune attaque est en cours
	self.mouvement()


#limite la fréquence d'attaque	
func limiter_attaque():
	var difference_temp = OS.get_ticks_msec() - derniere_attaque
	if difference_temp <= frequence_attaque:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true	

#Limiter le nombre d'apparition par seconde
func limiter_apparition():
	var difference_temp = OS.get_ticks_msec() - derniere_apparition
	if difference_temp <= frequence_apparition:
		return false
	derniere_apparition = OS.get_ticks_msec()	
	return true	


#attaque le personnage (L'attaque de la sorcière est de faire apparaître des ennemies)
func attaquer_personnage():
	#Stopper l'attaque si tous les ennemies sont apparu
	if enemie_apparu >= 4:
		attaque_en_cours = false
		derniere_attaque = OS.get_ticks_msec()
		enemie_apparu = 0
		return
		
	if limiter_apparition():
		#apparrition d'un zombie
		var instance_zombie = zombie.instance()
		var position_depart = obtenir_position_spawner()
		
		instance_zombie.start(position_depart)
		if get_tree().get_root().get_node("niveau/Jeu") != null:
			get_tree().get_root().get_node("niveau/Jeu").add_child(instance_zombie)
		else:
			queue_free()	
		enemie_apparu += 1


#obtenir laposition du spawner selon le nombre d'ennemie apparu
func obtenir_position_spawner():
	$SonRire.play()
	if enemie_apparu == 0:
		return $Spawner.global_position
		
	if enemie_apparu == 1:
		return $Spawner2.global_position
	
	if enemie_apparu == 2:
		return $Spawner2.global_position	
		
	return $Spawner3.global_position
