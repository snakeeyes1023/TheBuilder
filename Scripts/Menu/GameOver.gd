extends Control

func _on_ButtonMenu_pressed():
	get_tree().change_scene("res://Scenes/Menu/MenuPrincipale.tscn")


func _on_ButtonQuitter_pressed():
	get_tree().quit()
