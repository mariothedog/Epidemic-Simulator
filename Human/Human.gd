extends Area2D

var infected = false

func _ready():
	$"Health Bar".visible = false

func infect():
	infected = true
	$"Health Bar".visible = true
	$AnimationPlayer.play("Infect")
