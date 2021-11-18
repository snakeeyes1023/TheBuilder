extends Node2D

var Placeur_de_tourBase = preload("res://Scenes/Tours/PlaceurDeTourBase.tscn")
var Placeur_de_tourZone = preload("res://Scenes/Tours/PlaceurDeTourZone.tscn")
var Placeur_de_tourPique = preload("res://Scenes/Tours/PlaceurDeTourPique.tscn")

func _physics_process(delta):
	afficher_information_general()


func _on_TextureButton1_pressed():
	if InformationJeu.argent >= 100:
		var instance = Placeur_de_tourPique.instance()
		get_parent().add_child(instance)


func _on_TextureButton2_pressed():
	if InformationJeu.argent >= 200:
		var instance = Placeur_de_tourBase.instance()
		get_parent().add_child(instance)


func _on_TextureButton3_pressed():
	if InformationJeu.argent >= 300:
		var instance = Placeur_de_tourZone.instance()
		get_parent().add_child(instance)


func afficher_information_general():
	$VBoxContainer/LabelVie.text = "Vie: " + str(InformationJeu.pointDeVie)
	$VBoxContainer/LabelArgents.text = "Argent: " + str(InformationJeu.argent) + "$"


func Supp_balle(body):
	print(body.name)
	if body.name == "Balle":
		body.queue_free()
