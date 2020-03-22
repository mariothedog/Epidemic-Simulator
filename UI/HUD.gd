extends CanvasLayer

func _process(_delta):
	$"MarginContainer/HBoxContainer/Details".text = "Level %s %s\nAlive: %s\nSpread Chance: %s" % [
		global.current_level,
		global.epidemic_names[global.current_level-1],
		get_parent().get_node("Humans").get_child_count(),
		str(stepify(global.virus_spread_chance, 0.01))
	]
