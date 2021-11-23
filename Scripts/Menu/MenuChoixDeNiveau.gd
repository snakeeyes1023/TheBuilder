extends Control

func _on_ButtonDidactitiel_pressed():
	InformationJeu.reinitialiser_vie()
	get_tree().change_scene("res://Scenes/Niveaux/didacticiel.tscn")


func _on_ButtonLvl1_pressed():
	InformationJeu.reinitialiser_vie()
	get_tree().change_scene("res://Scenes/Niveaux/niveau-1.tscn")


func _on_ButtonLvl2_pressed():
	InformationJeu.reinitialiser_vie()
	get_tree().change_scene("res://Scenes/Niveaux/niveau-2.tscn")
