extends YSort

var human_scene = preload("res://Human/Human.tscn")

func _ready():
	randomize()
	
	for _i in range(10):
		var human = human_scene.instance()
		human.position = get_random_pos()
		add_child(human)

func get_random_pos():
	var x = rand_range(0, get_viewport_rect().size.x)
	var y = rand_range(0, get_viewport_rect().size.y)
	return Vector2(x, y)

func create_human(pos, infected):
	var human = human_scene.instance()
	human.position = pos
	call_deferred("add_child", human)
	human.call_deferred("delay_collisions")
	if infected:
		human.call_deferred("infect", true)
	else:
		human.call_deferred("play_spawn_anim")

func _process(_delta):
	if get_child_count() == 0:
		global.go_to_next_level()
