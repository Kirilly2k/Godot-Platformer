extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/NewGame.grab_focus()
	$transition_transparent_start_level/AnimationPlayer.play("fade_to_transparent_level_start")
	$VBoxContainer/Continue.disabled = true
	if Global.current_level:
		$VBoxContainer/Continue.disabled = false
		$VBoxContainer/Continue.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Up") || Input.is_action_just_pressed("Down"):
		$AudioStreamPlayer2.play()	
func _on_new_game_pressed():
	$transition_white/AnimationPlayer.play("fade_to_white_start_game")
	$AnimationPlayer.play("music_fade_out")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
	Global.total_crystals = 0
func _on_continue_pressed():
	if Global.current_level:
		$transition_white/AnimationPlayer.play("fade_to_white_start_game")
		$AnimationPlayer.play("music_fade_out")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file(Global.current_level)
	else:
		$AudioStreamPlayer2.play()	
func _on_settings_pressed():
	$Control.visible = true
	$Control/VBoxContainer2/Button.grab_focus()
	$VBoxContainer.visible = false
func _on_quit_pressed():
	get_tree().quit()





