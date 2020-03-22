extends Area2D

const SPEED = 300

var velocity = Vector2()
var speed_multiplier = 1

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

func _movement(delta):
	position += velocity * delta

func _on_Player_area_entered(area):
	_infect(area)

func _infect(human):
	if not human.infected:
		human.infect(false)
