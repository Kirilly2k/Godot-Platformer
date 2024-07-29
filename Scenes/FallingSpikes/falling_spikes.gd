extends Node2D

@onready var sfx_hit_player = $sfx_hit_player
@onready var sfx_fall = $sfx_fall
@onready var sfx_shake = $sfx_shake
@export var SPEED = 150
var player_entered = false
var current_SPEED = 0
func _physics_process(delta):
	position.y += current_SPEED * delta 
	
@onready var spawn_pos = global_position


func fall():
	current_SPEED = SPEED
	sfx_fall.play()
	await get_tree().create_timer(1).timeout
	player_entered = false
	position = spawn_pos
	$AnimationPlayer.play("Respawn")
	current_SPEED = 0

func _on_detection_area_entered(area):
	if area.get_parent() is Player :
		shake_sfx()
		player_entered = true
		$AnimationPlayer.play("Shake")
		$Assets.visible = true
	
func shake_sfx():
	if !player_entered:	
		sfx_shake.play()

func _on_hitbox_area_entered(area):
	if area.get_parent() is Player || area.get_parent() is Thief :
		sfx_hit_player.play()
		area.get_parent().death()
		
