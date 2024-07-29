extends CharacterBody2D

class_name Player

func _ready():
	Global.player = self

@onready var transition_transparent_start_level = $transition_transparent_start_level/AnimationPlayer
@onready var animation = $AnimationPlayer
@onready var sprite = $Sprite2D
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

@export var attacking = false
@export var dead = false


@onready var sfx_jump = $sfx_jump
@onready var sfx_sword = $sfx_sword
@onready var sfx_death = $sfx_death



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("Swing") && !dead:
		swing()

func swing_sound():
	sfx_sword.play()

func swing():
	if !dead:
		var hit_zone = $SwingArea.get_overlapping_areas()
		
		for area in hit_zone:
			var parent = area.get_parent()
			print(parent.name)
			if area.get_parent().is_in_group("Enemies"):
				area.get_parent().death()
				
		
		attacking = true
		if attacking == true && !dead: 
			animation.play("Swing")
		
func update_animation():
	if !attacking && !dead:
		if velocity.x != 0: 
			animation.play("Walk")
		if velocity.x == 0:
			animation.play("Idle")
		if velocity.y < 0:
			animation.play("Jump")
		if velocity.y > 0:
			animation.play("Fall")	

func _physics_process(delta):
	if !dead:
		if Input.is_action_pressed("left"):
			sprite.flip_h = true
			$SwingArea.scale.x = -1
		if Input.is_action_pressed("right"):
			sprite.flip_h = false	
			$SwingArea.scale.x = 1
		if not is_on_floor():
			velocity.y += gravity * delta


		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			sfx_jump.play()

	
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		update_animation()
		move_and_slide()
	
	if dead && !$RayCast2D.is_colliding():
		position.y += gravity * 0.3 * delta
	if position.y >= 1000:
		death()

func death():
	dead = true
	sfx_death.play()
	$AnimationPlayer.play("Death")
	
func respawn():
	transition_transparent_start_level.play("fade_to_transparent_level_start")
	Global.respawn_player()



