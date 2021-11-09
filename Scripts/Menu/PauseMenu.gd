extends Control

var menu_escape_visible = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_escape"):
		if menu_escape_visible == false:
			get_tree().paused = true
			self.raise()
			menu_escape_visible = true
			self.visible = true
		else:
			menu_escape_visible = false
			get_tree().paused = false
			self.visible = false


func _on_ButtonReprendre_pressed():
	menu_escape_visible = false
	get_tree().paused = false
	self.visible = false


func _on_ButtonRecommencer_pressed():
	get_parent().get_tree().reload_current_scene()
	get_tree().paused = false
	self.hide()

func _on_ButtonMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu/MenuPrincipale.tscn")


func _on_ButtonQuitter_pressed():
	get_tree().quit()
