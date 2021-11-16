extends Control

func _on_ButtonJouer_pressed():
		get_tree().change_scene("res://Scenes/Menu/MenuChoixDeNiveau.tscn")

func _on_ButtonQuitter_pressed():
	get_tree().quit()
