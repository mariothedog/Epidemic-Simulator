extends Area2D

var health = 100

var virus_damage = 0
var infected = false

func _ready():
	$"Health Bar".visible = false

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
