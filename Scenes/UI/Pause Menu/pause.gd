extends Control

func _ready():
	$AnimationPlayer.play_backwards("RESET")

func _process(delta):
	escape()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("Blur")
	$PanelContainer/VBoxContainer/Resume.release_focus()
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("Blur")
	$PanelContainer/VBoxContainer/Resume.grab_focus()
	
func escape():
	if Input.is_action_just_pressed("Pause") && get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("Pause") && get_tree().paused == true:
		resume()
		$PanelContainer/VBoxContainer/Resume.release_focus()
		$PanelContainer/VBoxContainer/Restart.release_focus()
		$PanelContainer/VBoxContainer/Menu.release_focus()	
func _on_resume_pressed():
	resume()
	
func _on_restart_pressed():
	resume()
	Global.crystals = 0
	get_tree().reload_current_scene()
	
func _on_menu_pressed():
	resume()
	Global.crystals = 0
	get_tree().change_scene_to_file("res://Scenes/UI/Main Menu/main_menu.tscn")
