extends Node2D

class_name Checkpoint
@export var spawnpoint = false
var activated = false
@onready var sfx_start = $sfx_start


func _ready():
	if spawnpoint:
		activate()
	
func activate():
	Global.current_checkpoint = self
	activated = true
	$AnimatedSprite2D.play("Checkpoint_Start")
	sfx_start.play()


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !activated:
		activate()

func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("Checkpoint_Activated")
