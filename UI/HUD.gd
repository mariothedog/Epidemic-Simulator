extends CanvasLayer

func _process(_delta):
	$"MarginContainer/HBoxContainer/Spread Chance".text = str(stepify(global.virus_spread_chance, 0.01))
	
	$"MarginContainer/HBoxContainer/Level Name".text = "Level %s %s" % [global.current_level, global.epidemic_names[global.current_level-1]]
