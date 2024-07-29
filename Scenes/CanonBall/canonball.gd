extends Node2D


var direction
var speed = 200
var hit = false
@onready var explosion = $Explosion

func _physics_process(delta):
	position.x += speed * delta * direction
	if $RayCast2D.is_colliding():
		explode()
		
func explosion_sound():
	explosion.play()
		
func explode():
	hit = true
	speed = 0
	$AnimationPlayer.play("Explode")
	$CannonBall.visible = false
	
func _on_area_2d_area_entered(area):
	if !hit && area.get_parent() is Player || area.get_parent().is_in_group("Enemies") :
		area.get_parent().death()
		explode()


