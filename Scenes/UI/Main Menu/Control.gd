extends Control

func _on_button_pressed():
	$".".visible = false
	$"../VBoxContainer/Settings".grab_focus()
	$"../VBoxContainer".visible = true
	
