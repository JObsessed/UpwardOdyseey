extends Node

var max_health : int = 5
var curr_health : int

signal on_health_change

func _ready():
	curr_health = max_health

func decrease_health(value: int) -> void:
	curr_health -= value
	if curr_health < 0:
		curr_health = 0
	print("Health decreased")
	on_health_change.emit(curr_health)

func increase_health(value : int) -> void:
	curr_health += value
	if curr_health >= max_health:
		curr_health = max_health
	print("Health increased")
	on_health_change.emit(curr_health)

func reset_health() -> void:
	for i in 5:
		curr_health += 1
		on_health_change.emit(curr_health)
	
