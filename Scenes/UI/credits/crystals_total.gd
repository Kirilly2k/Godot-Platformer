extends Label


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$".".text = "Всего кристаллов собрано: \n" +  str(Global.total_crystals + Global.crystals) + "/25"
