extends Control



func _on_ButtonDidactitiel_pressed():
	InformationJeu.reinitialiser_vie()
	get_tree().change_scene("res://Scenes/jeu.tscn")


func _on_ButtonLvl1_pressed():
	InformationJeu.reinitialiser_vie()


func _on_ButtonLvl2_pressed():
	InformationJeu.reinitialiser_vie()
