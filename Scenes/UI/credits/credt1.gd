extends Control



func _on_area_2d_area_entered(area):
	if !visible:
		visible = true
		$AnimationPlayer.play("fade_in")
