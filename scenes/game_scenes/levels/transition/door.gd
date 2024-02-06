extends Node2D

@export var next_level : String
@export var key_id : String

@onready var animated_sprite_2d : AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d : CollisionShape2D = $CollisionShape2D

var door_is_open : bool 

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var player = body as CharacterBody2D
		process_mode = player.PROCESS_MODE_PAUSABLE
	
	await get_tree().create_timer(3.0).timeout
	print("Going to next level")
	SceneManager.level_transition(next_level)


func _on_key_area_2d_2_body_entered(body):
	if body.is_in_group("player"):
		var has_item : bool = InventoryManager.check_for_item(key_id)
		
		if not has_item:
			return
		
		if not door_is_open:
			animated_sprite_2d.play("open_door")
			door_is_open = true
			#deaktiviert Kollisionshape, damit Spieler hindurch gehen kann
			collision_shape_2d.set_deferred("disabled", true)

func _on_key_area_2d_2_body_exited(body):
	if body.is_in_group("player"):
		if door_is_open:
			animated_sprite_2d.play("close_door")
			door_is_open = false
