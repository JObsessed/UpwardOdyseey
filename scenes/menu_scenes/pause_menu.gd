extends CanvasLayer

@onready var texture_rect = $TextureRect as TextureRect
@onready var margin_container = $MarginContainer as MarginContainer
@onready var settings_menu = $settings_menu as Control
@onready var settings_button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/settings_button as TextureButton

func _ready():
	button_connections()

func _on_continue_button_pressed():
	GameManager.continue_game()
	queue_free()

func _on_exit_button_pressed():
	GameManager.leave_game()
	queue_free()

func make_pause_menu_visible() -> void:
	margin_container.visible = true
	
func make_pause_menu_invisible() -> void:
	margin_container.visible = false
	
func settings_pressed() -> void:
	make_pause_menu_invisible()
	settings_menu.visible = true
	settings_menu.set_process(true)

func exit_settings() -> void:
	make_pause_menu_visible()
	settings_menu.visible = false

func button_connections() -> void:
	settings_button.button_down.connect(settings_pressed)
	settings_menu.exit_settings.connect(exit_settings)
