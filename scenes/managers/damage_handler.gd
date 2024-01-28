class_name DamageHandler
extends Node

@export var parent_node : Node2D = null

signal handle_damage

func _ready():
	handle_damage.connect(on_handle_damage)
	
func on_handle_damage() -> void:
	
	parent_node.queue_free()
