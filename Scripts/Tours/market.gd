extends Control

var Placeur_de_tour = preload("res://Scenes/Tours/PlaceurDeTour.tscn")

export var argent = 300

func ready():
	changer_argent(0)

func _on_TextureButton1_pressed():
	if argent >= 100:
		var instance = Placeur_de_tour.instance()
		get_parent().add_child(instance)


func _on_TextureButton2_pressed():
	if argent >= 200:
		print("tour 200$")


func _on_TextureButton3_pressed():
	if argent >= 300:
		print("tour 300$")

func changer_argent(argent_changement):
	argent += argent_changement
	$VBoxContainer/LabelArgents.text = "Argent: " + str(argent) + "$"
