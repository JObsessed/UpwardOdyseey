extends Node

var loading_screen = preload("res://scenes/user_interface/screens/transition.tscn")


var menus : Dictionary = 	{"Mainmenu" : "res://scenes/menu_scenes/main_menu.tscn",
							"DeathScreen" : "res://scenes/menu_scenes/death_menu.tscn"}

var levels: Dictionary = { "Level1": "res://scenes/game_scenes/levels/tutorial_level_1.tscn",
							"Level2": "res://scenes/game_scenes/levels/tutorial_level_2.tscn",
							"Level3": "res://scenes/game_scenes/levels/tutorial_level_3.tscn"
							}
							
func level_transition(level : String):
	var level_path : String = levels.get(level)

	if level_path != null:
		var loading_screen_instance = loading_screen.instantiate()
		get_tree().get_root().add_child(loading_screen_instance)
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file(level_path)
		loading_screen_instance.queue_free()

func menu_transition(menu : String):
	var menu_path : String = menus.get(menu)

	if menu_path != null:
		if menu_path == "DeathScreen":
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file(menu_path)
		else:
			var loading_screen_instance = loading_screen.instantiate()
			get_tree().get_root().add_child(loading_screen_instance)
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file(menu_path)
			loading_screen_instance.queue_free()
