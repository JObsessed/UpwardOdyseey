extends Node2D

@export var can_take_damage : bool = true
@export var objectHealthPoints : int = 20

@onready var hitanimation = $HitAnimationPlayer as AnimationPlayer

var destruct_eff = preload("res://scenes/game_scenes/Enemies/effects/enemy_death.tscn")

var object_is_intact : bool = true
var damage : int

func take_damage() -> void:
	if can_take_damage:
		if objectHealthPoints  > 0:
			objectHealthPoints  -= damage
			if objectHealthPoints  <= 0:
				object_is_intact = false
				if not object_is_intact:
					var destruct_instance = destruct_eff.instantiate() as Node2D
					destruct_instance.global_position = global_position
					get_parent().add_child(destruct_instance)
					queue_free()
					print("object is destroyed")
			elif objectHealthPoints > 0:
				print(objectHealthPoints)


func _on_area_2d_area_entered(area):
	print("Projectile has hit object")
	hitanimation.play("hit")
	damage = 2 
	take_damage()
	
