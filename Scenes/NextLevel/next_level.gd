extends Area2D



@onready var animation = $CanvasLayer/AnimationPlayer

func _ready():
	Global.crystals = 0
	Global.current_level = get_tree().current_scene.scene_file_path
	print(Global.current_level)
	

func _on_area_entered(area):
	if area.get_parent() is Player:
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = "res://Scenes/Levels/level_" + str(next_level_number) +  ".tscn"
		animation.play("transition_to_white_portal")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file(next_level_path)
		print("Уровень ", next_level_number) 
		Global.total_crystals += Global.crystals




