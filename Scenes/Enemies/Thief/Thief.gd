extends CharacterBody2D

class_name Thief

@export var SPEED = 50.0
@onready var sprite = $Sprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var dead = false
@export var facing_left = false
@export var swinging = false
@onready var sfx_hit = $sfx_hit
@onready var sfx_swing = $sfx_swing


func _physics_process(delta):
	# Add the gravity.
	if !dead && !swinging:
		if velocity.x != 0:
			$AnimationPlayer.play("Walk")
		if not is_on_floor():
			velocity.y += gravity * delta
		velocity.x = SPEED
		if !$RayCast2D.is_colliding() && is_on_floor() || $RayCast2D2.is_colliding():
			flip()
		move_and_slide()
		
	if dead && !$RayCast2D.is_colliding():
		position.y += gravity * 0.3 * delta
func flip():
	facing_left = !facing_left
	scale.x = scale.x * -1
	if facing_left:
		SPEED = abs(SPEED) * -1
	else:
		SPEED = abs(SPEED)
		

func swing():
	swinging = true
	sfx_swing.play()
	$AnimationPlayer.play("Swing")

	
func _on_hitbox_area_entered(area):
	if area.get_parent() is Player && !dead:
		swing()
		area.get_parent().death()
		
func death():
	dead = true
	sfx_hit.play()
	$AnimationPlayer.play("Death")







