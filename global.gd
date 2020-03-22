extends Node

var current_level = 1

var virus_damage = 10
var virus_spread_chance = 1
var virus_spread_resistance = 0.2 # Percentage of virus_spread_chance reduced.
var virus_pass_down_chance = 0.9 # Percentage chance that if both parents have the virus it will be passed down to the child.

var epidemic_names = [
	"Smallpox",
	"Spanish Flu",
	"Bubonic Plague",
	"HIV",
	"COVID-19",
	"Malaria",
	"Cholera",
	"Ebola",
	"Dengue",
	"Zika Virus"
]

var epidemic_initial_spread = [
	1,
	0.9,
	0.8,
	0.6,
	0.6,
	0.5,
	0.4,
	0.4,
	0.3,
	0.3
]

var epidemic_spread_resistance = [
	0.2,
	0.3,
	0.4,
	0.4,
	0.4,
	0.4,
	0.5,
	0.5,
	0.6,
	0.7
]

var epidemic_movement_speed = [
	300,
	300,
	300,
	250,
	250,
	200,
	150,
	150,
	150,
	150
]

var epidemic_damage = [
	10,
	15,
	30,
	20,
	20,
	30,
	40,
	60,
	70,
	80
]

var epidemic_pass_down_chance = [
	0.9,
	0.6,
	0.5,
	0.5,
	0.4,
	0.4,
	0.3,
	0.3,
	0.2,
	0.1
]

func go_to_next_level():
	current_level += 1
	virus_damage = epidemic_damage[current_level-1]
	virus_spread_chance = epidemic_initial_spread[current_level-1]
	virus_spread_resistance = epidemic_spread_resistance[current_level-1]
	virus_pass_down_chance = epidemic_pass_down_chance[current_level-1]
	
	restart_level()

func restart_level():
	if get_tree().reload_current_scene() != OK:
		print_debug("An error occured while reloading the current scene.")
