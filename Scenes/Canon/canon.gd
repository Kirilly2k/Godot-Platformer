extends StaticBody2D

var canonball = load("res://Scenes/CanonBall/canonball.tscn")
var dead = false
@export var shooting : bool
var firerate = 3
@onready var shot = $sfx_shot
@onready var sfx_break = $sfx_break
@onready var firepoint = $Marker2D


func _ready():
	if !dead:
		shooting = true
		shoot()
	
func shoot():
	if !dead:
		while shooting:
			$AnimationPlayer.play("Fire")
			await get_tree().create_timer(firerate).timeout
		
func fire():
	if !dead:
		shot.play()		
		var spawned_ball = canonball.instantiate()
		spawned_ball.direction = -firepoint.scale.x
		spawned_ball.global_position = firepoint.position
		add_child(spawned_ball)
	
func death():
	dead = true
	sfx_break.play()
	$AnimationPlayer.play("Death")
