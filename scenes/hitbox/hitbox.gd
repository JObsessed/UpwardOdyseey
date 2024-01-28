class_name Hitbox
extends Area2D

@export var health_handler : HealthHandler = null

signal apply_hit(damage : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_hit.connect(on_apply_hit)

func on_apply_hit( damage : int) -> void:
	if health_handler == null:
		print("Fehler (Debug)")
		return
	
	health_handler.apply_damage.emit(damage)
