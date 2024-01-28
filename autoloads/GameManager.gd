extends Node

#var sandobox_level = preload("res://scenes/game_scenes/levels/testarea.tscn")
var pause_menu = preload("res://scenes/menu_scenes/pause_menu.tscn")
var main_menu = preload("res://scenes/menu_scenes/main_menu.tscn")
var death_screen_menu = preload("res://scenes/menu_scenes/death_screen_menu.tscn")


func _ready():
	pass
	#RenderingServer.set_default_clear_color(Color(0.980392, 0.921569, 0.843137, 1))
	#RenderingServer.set_default_clear_color(Color(0.960784, 0.960784, 0.862745, 1))
	#RenderingServer.set_default_clear_color(Color(0.662745, 0.662745, 0.662745, 1))
	
func start_game():
	if get_tree().paused:
		continue_game()
		return
		
	SceneManager.level_transition("Level1")



func quit_game():
	get_tree().quit()
	
func pause_game():
	get_tree().paused = true
	
	var pause_instance = pause_menu.instantiate()
	get_tree().get_root().add_child(pause_instance)
	
func continue_game():
	get_tree().paused = false
	
func restart_game():
	SceneManager.level_transition("Level1")

func leave_game():
	#var main_menu_instance = main_menu.instantiate()
	#get_tree().get_root().add_child(main_menu_instance)
	SceneManager.menu_transition("Mainmenu")
	
func death_screen():
	SceneManager.menu_transition("DeathScreen")
	
