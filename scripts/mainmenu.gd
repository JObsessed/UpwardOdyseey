
extends Control

#Get Buttons from UI
@onready var newGame_button = $newGame_button as TextureButton
@onready var exit_button = $exit_button as TextureButton
@onready var levelSelect_button = $selectLevel_button as TextureButton
@onready var settings_button = $settings_button as TextureButton
@onready var settings_menu = $settings_menu as settings #extends from settings in setting_menu script

#Preload Levels
@onready var newGame_level = preload("res://scenes/game_scenes/levels/testarea.tscn") as PackedScene
@onready var settings = preload("res://scenes/menu_scenes/settings_menu.tscn") as PackedScene

func _ready():
	button_connections()
	
func settings_pressed() -> void:
	make_mainMenu_invisible()
	settings_menu.visible = true
	settings_menu.set_process(true)
	$AudioStreamPlayer2D.play()
	
func exit_settings() -> void:
	settings_menu.visible = false
	make_mainMenu_visible()
	$AudioStreamPlayer2D.play()
	
func make_mainMenu_invisible() -> void:
	newGame_button.visible = false
	levelSelect_button.visible = false
	exit_button.visible = false
	
func make_mainMenu_visible() -> void:
	newGame_button.visible = true
	levelSelect_button.visible = true
	exit_button.visible = true
	
func newGame_pressed() -> void:
	$AudioStreamPlayer2D.play()
	GameManager.start_game()

func levelSelect_pressed() -> void:
	return
	
func exit_pressed() -> void:
	$AudioStreamPlayer2D.play()
	GameManager.quit_game()
	
	
func button_connections() -> void:
	newGame_button.button_down.connect(newGame_pressed)
	levelSelect_button.button_down.connect(levelSelect_pressed)
	settings_button.button_down.connect(settings_pressed)
	exit_button.button_down.connect(exit_pressed)
	settings_menu.exit_settings.connect(exit_settings) #signal from settings_menu script
	

#Hover Sound Effekts: Wahrscheinlich einfacher einen Texture Button zu erstellen und die anderen zu instanzieren..
func _on_select_level_button_mouse_entered():
	$AudioStreamPlayer2D.play()
func _on_new_game_button_mouse_entered():
	$AudioStreamPlayer2D.play()
func _on_exit_button_mouse_entered():
	$AudioStreamPlayer2D.play()
func _on_settings_button_mouse_entered():
	$AudioStreamPlayer2D.play()
