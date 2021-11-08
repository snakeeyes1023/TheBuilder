extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu/MenuChoixDeNiveau.tscn")


func _on_Button2_pressed():
	print("À faire si on décide d'avoir des options.")


func _on_Button3_pressed():
	get_tree().quit()
