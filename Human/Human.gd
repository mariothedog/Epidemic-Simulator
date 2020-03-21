extends Area2D

const SPEED = 100

var health = 100

var virus_damage = 0
var infected = false

onready var pos = position

func _ready():
	$"Health Bar".visible = false

func _physics_process(delta):
	_ai(delta)

func _ai(delta):
	if _stepify_vector(position, 10) == _stepify_vector(pos, 10):
		pos = _get_random_pos()
	var dir = position.direction_to(pos)
	position += dir * SPEED * delta

func _get_random_pos():
	var x = rand_range(0, get_viewport_rect().size.x)
	var y = rand_range(0, get_viewport_rect().size.y)
	return Vector2(x, y)

func _stepify_vector(vec, step):
	return Vector2(stepify(vec.x, step), stepify(vec.y, step))

func infect(damage):
	infected = true
	virus_damage = damage
	$"Health Bar".visible = true
	$AnimationPlayer.play("Infect")
	$Damage.start()

func _on_Damage_timeout():
	health -= virus_damage
	health = max(health, 0)
	if health == 0:
		_die()
	$Tween.interpolate_property($"Health Bar", "value", $"Health Bar".value, health, 0.5)
	$Tween.start()

func _die():
	$AnimationPlayer.play("Die")
	yield($AnimationPlayer, "animation_finished")
	queue_free()
