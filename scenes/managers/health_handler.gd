class_name HealthHandler
extends Node

@export var max_health : int = 3
@export var damage_handler : DamageHandler = null

var curr_health : int = 0

signal apply_damage(damage: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_health = max_health
	apply_damage.connect(on_apply_damage)
	
func handle_health() -> void:
	if curr_health > 0:
		return
		
	if curr_health <= 0:
		curr_health = 0
		
		if damage_handler == null:
			print("Fehler: kein Schaden")
			return
		
		#Bei Tod wird Signal ausgegeben
		damage_handler.handle_damage.emit()

func calc_damage(damage : int) -> void:
	curr_health -= damage

func on_apply_damage(damage : int) -> void:
	handle_health()
	
	if damage > 0:
		calc_damage(damage)

