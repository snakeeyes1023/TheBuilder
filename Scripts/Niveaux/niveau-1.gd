extends "res://Scripts/Niveaux/NiveauBase.gd"

var liste_enemie = [preload("res://Scenes/Enemies/Bomber.tscn"), preload("res://Scenes/Enemies/Zombie.tscn")]
var frequence = 2000
var duree = 20000
var prochain_niveau = "res://Scenes/Niveaux/niveau-2.tscn"

func _init().(liste_enemie, duree, frequence, prochain_niveau):
	pass


func _physics_process(_delta):
	self.spawner()
