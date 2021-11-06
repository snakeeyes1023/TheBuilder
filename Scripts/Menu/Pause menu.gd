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


func _on_Button_pressed():
	menu_escape_visible = false
	get_tree().paused = false
	self.visible = false


func _on_Button2_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu/Menu Principale.tscn")


func _on_Button3_pressed():
	get_tree().quit()


func _on_Button4_pressed():
	get_parent().get_tree().reload_current_scene()
	get_tree().paused = false
	self.hide()
