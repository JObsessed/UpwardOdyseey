class_name Hurtbox
extends Area2D

var dmg_var : int = 0

func _ready():
	area_entered.connect(on_area_entered)

	
func on_area_entered(area : Area2D) -> void:
	if area is Hitbox:
		area.apply_hit.emit(dmg_var)
