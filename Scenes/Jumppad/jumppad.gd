extends Node2D


@export var force = -550
@onready var sfx_push = $sfx_push

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player || area.get_parent() is Thief:
		area.get_parent().velocity.y = force 
		sfx_push.play()
		$AnimationPlayer.play("Push")
