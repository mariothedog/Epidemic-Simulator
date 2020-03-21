extends Area2D

var infected = false

func infect():
	$AnimationPlayer.play("Infect")
