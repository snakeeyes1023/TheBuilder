extends Control

var Placeur_de_tourBase = preload("res://Scenes/Tours/PlaceurDeTourBase.tscn")
var Placeur_de_tourZone = preload("res://Scenes/Tours/PlaceurDeTourZone.tscn")
var Placeur_de_tourPique = preload("res://Scenes/Tours/PlaceurDeTourPique.tscn")
export var argent = 300

func ready():
	changer_argent(0)

func _on_TextureButton1_pressed():
	if argent >= 100:
		var instance = Placeur_de_tourPique.instance()
		get_parent().add_child(instance)


func _on_TextureButton2_pressed():
	if argent >= 200:
		var instance = Placeur_de_tourBase.instance()
		get_parent().add_child(instance)


func _on_TextureButton3_pressed():
	if argent >= 300:
		var instance = Placeur_de_tourZone.instance()
		get_parent().add_child(instance)

func changer_argent(argent_changement):
	argent += argent_changement
	$VBoxContainer/LabelArgents.text = "Argent: " + str(argent) + "$"
