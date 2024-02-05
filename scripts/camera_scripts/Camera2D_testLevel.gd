extends Camera2D


@export var player_character : CharacterBody2D

func _physics_process(_delta):
	if player_character != null:
		global_position = player_character.global_position
