extends Area2D

const SPEED = 300

var velocity = Vector2()
var speed_multiplier = 1
var damage = 10

func _physics_process(delta):
	_get_input()
	_movement(delta)

func _get_input():
	# Movement input
	var input_vel = Vector2()
	
	if Input.is_action_pressed("move_right"):
		input_vel.x += 1
	if Input.is_action_pressed("move_left"):
		input_vel.x -= 1
	if Input.is_action_pressed("move_up"):
		input_vel.y -= 1
	if Input.is_action_pressed("move_down"):
		input_vel.y += 1
	
	velocity = input_vel.normalized() * SPEED * speed_multiplier
	
	# Other input
	if Input.is_action_pressed("infect"):
		for human in get_overlapping_areas():
			_infect(human)

func _movement(delta):
	position += velocity * delta

func _infect(human):
	if not human.infected:
		human.infect(damage)
