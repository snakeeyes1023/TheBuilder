extends "res://Scripts/Niveaux/NiveauBase.gd"

var liste_enemie = [preload("res://Scenes/Enemies/Sorciere.tscn"), preload("res://Scenes/Enemies/Zombie.tscn"), preload("res://Scenes/Enemies/Bomber.tscn")]
var frequence = 2000
var duree = 30000
var prochain_niveau = "res://Scenes/Menu/MenuPrincipale.tscn"


func _init().(liste_enemie, duree, frequence, prochain_niveau):
	pass


func _physics_process(_delta):
	self.spawner()
	
