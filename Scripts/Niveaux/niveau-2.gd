extends "res://Scripts/Niveaux/NiveauBase.gd"
#liste d'ennemie pouvant apparaître
var liste_enemie = [preload("res://Scenes/Enemies/Sorciere.tscn"), preload("res://Scenes/Enemies/Zombie.tscn"), preload("res://Scenes/Enemies/Bomber.tscn")]
#fréquence d'appartion d'ennemie
var frequence = 2000
#durée de la manche
var duree = 25000
#scene du prochain niveau
var prochain_niveau = "res://Scenes/Menu/MenuChoixDeNiveau.tscn"


func _init().(liste_enemie, duree, frequence, prochain_niveau):
	pass


func _physics_process(_delta):
	self.spawner()
	
