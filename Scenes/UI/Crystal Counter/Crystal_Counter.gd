extends CanvasLayer


func _ready():
	Global.gained_crystals.connect(update_crystal_counter)

func update_crystal_counter(gained_crystals):
	$CrystalCounter.text = str(Global.crystals) + "/3"
