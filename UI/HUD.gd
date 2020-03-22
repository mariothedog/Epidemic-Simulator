extends CanvasLayer

func _process(_delta):
	$"MarginContainer/HBoxContainer/Spread Chance".text = str(stepify(global.virus_spread_chance, 0.01))
