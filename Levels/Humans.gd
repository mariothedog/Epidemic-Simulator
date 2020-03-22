extends YSort

var human_scene = preload("res://Human/Human.tscn")

func create_human(pos, infected):
	var human = human_scene.instance()
	human.position = pos
	call_deferred("add_child", human)
	human.call_deferred("delay_collisions")
	if infected:
		human.call_deferred("infect", true)
	else:
		human.call_deferred("play_spawn_anim")
