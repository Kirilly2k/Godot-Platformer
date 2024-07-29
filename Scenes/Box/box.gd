extends Node2D


func death():
	$AnimationPlayer.play("breaking")
	$sfx_break.play()
