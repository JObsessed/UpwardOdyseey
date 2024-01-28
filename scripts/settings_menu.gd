class_name settings
extends Control

@onready var exit_setting_button = $MarginContainer/VBoxContainer/exit_setting_button as TextureButton

signal exit_settings

func _ready(): 
	exit_setting_button.button_down.connect(exit_settings_pressed)
	set_process(false)
	
func exit_settings_pressed() -> void:
	exit_settings.emit()
	set_process(false)
	
func _on_exit_setting_button_mouse_entered():
	$AudioStreamPlayer2D.play()
