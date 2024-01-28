extends Node2D

@export var heart_full : Texture2D
@export var heart_empty : Texture2D

@onready var heart_1 = $heart_1
@onready var heart_2 = $heart_2
@onready var heart_3 = $heart_3
@onready var heart_4 = $heart_4
@onready var heart_5 = $heart_5

func _ready():
	HealthManager.on_health_change.connect(on_player_health_changed)

func on_player_health_changed(curr_player_health : int):
	if curr_player_health == 5:
		heart_5.texture = heart_full
	elif curr_player_health < 5:
		heart_5.texture = heart_empty
		
	if curr_player_health == 4:
		heart_4.texture = heart_full
	elif curr_player_health < 4:
		heart_4.texture = heart_empty
		
	if curr_player_health == 3:
		heart_3.texture = heart_full
	elif curr_player_health < 3:
		heart_3.texture = heart_empty

	if curr_player_health == 2:
		heart_2.texture = heart_full
	elif curr_player_health < 2:
		heart_2.texture = heart_empty
		
	if curr_player_health == 1:
		heart_1.texture = heart_full
	elif curr_player_health < 1:
		heart_1.texture = heart_empty
