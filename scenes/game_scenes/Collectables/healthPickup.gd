extends Node2D

@export var value : int = 1

signal collect_health
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		HealthManager.increase_health(value)
		queue_free()
