extends Area2D

const SPEED = 100

var health = 100

var can_create_human = true

var virus_damage = 0
var virus_spread_chance = 0
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

func infect():
	infected = true
	$"Health Bar".visible = true
	$AnimationPlayer.play("Infect")
	$Damage.start()

func _on_Damage_timeout():
	health -= global.virus_damage
	health = max(health, 0)
	if health == 0:
		_die()
	$Tween.interpolate_property($"Health Bar", "value", $"Health Bar".value, health, 0.5)
	$Tween.start()

func _die():
	$AnimationPlayer.play("Die")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Die":
		queue_free()

func _on_Human_area_entered(area):
	if "Human" in area.name:
		if infected and not area.infected and randf() < global.virus_spread_chance:
			area.infect()
		else:
			if can_create_human and area.can_create_human:
				get_parent().create_human(position)
				
				delay_ability_to_create_humans()
				area.delay_ability_to_create_humans()

func delay_ability_to_create_humans():
	can_create_human = false
	$"Delay Ability to Create Humans".start()

func _on_Delay_Ability_to_Create_Humans_timeout():
	can_create_human = true

func delay_collisions():
	$CollisionShape2D.set_deferred("disabled", true)
	$"Delay Collisions".start()

func _on_Delay_Collisions_timeout():
	$CollisionShape2D.set_deferred("disabled", false)

func play_spawn_anim():
	$AnimationPlayer.play("Spawn")
