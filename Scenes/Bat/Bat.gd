extends CharacterBody2D

class_name Bat

var SPEED = 50.0
var facing_right = true
var dead = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	position.x += SPEED * delta 
	
	if dead && $RayCast2D.is_colliding():
		SPEED = 0
	
	
	if $RayCast2D.is_colliding() && !dead:
		flip()
		
	if dead && !$RayCast2D2.is_colliding():
		position.y += gravity * 0.1 * delta
		
			
func flip():
	SPEED = SPEED * -1
	scale.x = scale.x * -1
	

	
func death():
	dead = true
	$AnimationPlayer.play("Death")
	

func _on_area_2d_2_area_entered(area):
	if area.get_parent() is Player && !dead:
		area.get_parent().death()
