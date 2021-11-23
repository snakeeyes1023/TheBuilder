extends Node

var _liste_enemie = null
var _duree = 40000
var _frequence = 1500
var derniere_attaque = OS.get_ticks_msec()
var debut_attaque = OS.get_ticks_msec()
var _prochain_niveau = "res://Scenes/Menu/MenuPrincipale.tscn"


func _init(liste_enemie,duree,frequence, prochain_niveau = null).():
	_liste_enemie = liste_enemie
	_duree = duree
	_frequence = frequence
	if prochain_niveau != null:
		_prochain_niveau = prochain_niveau


func _physics_process(_delta):
	verifier_fin_niveau()
	
	if limiter_apparition():
		attaquer()
	
	
#limite la fréquence de tire du vaisseau	
func limiter_apparition():
	var difference_temp = OS.get_ticks_msec() - derniere_attaque
	if difference_temp <= _frequence:
		return false
	derniere_attaque = OS.get_ticks_msec()	
	return true	


func verifier_fin_niveau():
	var difference_temp = OS.get_ticks_msec() - debut_attaque
	if difference_temp > _duree:
		prochain_niveau()


func attaquer():
	var enemie = obtenir_ennemie_random()
	var position = obtenir_position_spawner()
	var b = enemie.instance()
	b.start(position)
	get_parent().add_child(b)
	
	
func obtenir_position_spawner():
	var spawner_random = randi()%3
	
	if spawner_random == 1:
		return $Jeu/Spawner/curseur1.global_position
	if spawner_random == 2:
		return $Jeu/Spawner/curseur2.global_position
	if spawner_random == 3:
		return $Jeu/Spawner/curseur3.global_position
	return $Jeu/Spawner/curseur2.global_position


func obtenir_ennemie_random():
	return _liste_enemie[randi() % _liste_enemie.size()]


func prochain_niveau():
	InformationJeu.reinitialiser_vie()
	get_tree().change_scene(_prochain_niveau)
	queue_free()
