class_name inputKeyButton
extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button

@export var input_key_name : String = "ui_left"

func _ready():
	set_process_unhandled_key_input(false) # Wenn wahr, kann input_key verändert werden
	set_key_name()
	set_text_for_key()
	
func set_key_name() -> void:
	label.text = "Null"
	
	match input_key_name: #Bessere Darstellung im UI, sonst müsste es in den Projekteinstellungen umbenannt werden
		"ui_left":
			label.text = "Move to left"
		"ui_right":
			label.text = "Move to right"
		"jump":
			label.text = "Jump"
	
func set_text_for_key() -> void:
	# Godot kann nicht direkt auf Buttons zugreifen, sondern muss erst filtern
	var action_events = InputMap.action_get_events(input_key_name)
	#print(action_events)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	button.text = "%s" % action_keycode
	
func _on_button_toggled(button_pressed): # Prüft ob der Knopf gedrückt ist
	if button_pressed:
		button.text = "Press new key..."
		set_process_unhandled_key_input(button_pressed)
		
		for index in get_tree().get_nodes_in_group("hotkey_button"):
			# Was ist der derzeitigte Name der Aktion (z.B "ui_left"
			if index.input_key_name != self.input_key_name:
				index.button.toggle_mode = false
				index.set_process_unhandled_key_input(false)
		
	else:
		
		for index in get_tree().get_nodes_in_group("hotkey_button"):
			if index.input_key_name != self.input_key_name:
				index.button.toggle_mode = true
				index.set_process_unhandled_key_input(false)
				
		set_text_for_key()
	
func _unhandeled_key_input(event):
	set_new_action_key(event)
	button.button_pressed = false
	
func set_new_action_key(event) -> void:
	InputMap.action_erase_events(input_key_name)
	InputMap.action_erase_event(input_key_name, event)
	
	
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_key_name()
