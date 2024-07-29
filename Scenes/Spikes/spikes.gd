extends Node2D

@onready var sfx_hit_player = $sfx_hit_player

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player || area.get_parent() is Thief:
		sfx_hit_player.play()
		area.get_parent().death()
