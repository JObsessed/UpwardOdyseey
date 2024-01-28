extends Node2D

var player
#
func _ready():
	player = get_tree().get_first_node_in_group("player")
	
func _process(delta):
	check_player_death()
#
func check_player_death():
	if player != null:
		return
	else:
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_file("res://scenes/menu_scenes/death_screen_menu.tscn")
		
