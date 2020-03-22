extends YSort

var human_scene = preload("res://Human/Human.tscn")

func create_human(pos):
	var human = human_scene.instance()
	human.position = pos
	call_deferred("add_child", human)
	human.call_deferred("delay_collisions")
	human.call_deferred("play_spawn_anim")
