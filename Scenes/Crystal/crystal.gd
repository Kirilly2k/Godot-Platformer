extends Node2D


var got_crystal = false

func _on_area_2d_area_entered(area):
	if got_crystal == false:
		$Area2D/AudioStreamPlayer2D.play()
		Global.gain_crystals(1)
		got_crystal = true
		$AnimatedSprite2D.visible = false
		await get_tree().create_timer(1).timeout
		queue_free()
