extends Area2D

var infected = false

func infect():
	infected = true
	$AnimationPlayer.play("Infect")
