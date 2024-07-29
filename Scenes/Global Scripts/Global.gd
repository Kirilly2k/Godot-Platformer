extends Node

var current_checkpoint : Checkpoint

var player: Player






@export var current_level : String
@export var total_crystals : int

		
		
func respawn_player():
	if current_checkpoint != null:
		player.velocity.y = 0
		player.position = current_checkpoint.global_position 
		

	
	
	
	
	
signal gained_crystals(int)
var crystals = 0
func gain_crystals(crystals_gained):
	crystals += crystals_gained
	emit_signal("gained_crystals", crystals_gained)
	print (crystals)
	

