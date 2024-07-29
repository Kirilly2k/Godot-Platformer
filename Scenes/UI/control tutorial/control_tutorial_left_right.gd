extends Control


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		$AnimationPlayer.play("fade_in")
		
func _on_area_2d_area_exited(area):
	if area.get_parent() is Player:
		$AnimationPlayer.play_backwards("fade_in")
