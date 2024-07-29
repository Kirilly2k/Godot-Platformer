extends Area2D


func _on_area_entered(area):
	if area.get_parent() is Player:
			$CanvasLayer/AnimationPlayer.play("transition_to_white_portal")
			await get_tree().create_timer(1.5).timeout
			get_tree().change_scene_to_file("res://Scenes/UI/Main Menu/main_menu.tscn")
		
