extends Control

func _on_Button_pressed():
	_go_to_first_level()

func _go_to_first_level():
	if get_tree().change_scene("res://Levels/Level.tscn") != OK:
		print_debug("An error occured while changing to the level scene.")
