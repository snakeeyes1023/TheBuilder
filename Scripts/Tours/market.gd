extends Control

var Tour_de_Base = preload("res://Scenes/Tours/TourDeBase.tscn")

export var argent = 300

func _on_TextureButton1_pressed():
	if argent >= 100:
		print("test")
		var instance = Tour_de_Base.instance()
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
