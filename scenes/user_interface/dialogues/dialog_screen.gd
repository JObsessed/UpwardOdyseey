extends Node2D

@export_file("*.json") var dialogue_script

@onready var display_name = $Panel/Name as RichTextLabel
@onready var display_text = $Panel/Text as RichTextLabel
@onready var chat_sound = $chat_sound as AudioStreamPlayer2D

var dialogues: Dictionary = {"Level1": "res://scenes/user_interface/dialogues/dialogue_scripts/dialog_level_1.json",
							"Level2" : "res://scenes/user_interface/dialogues/dialogue_scripts/dialog_level_2.json",
							"Level3_1" : "res://scenes/user_interface/dialogues/dialogue_scripts/dialog_level_3_1.json",
							"Level3_2" : "res://scenes/user_interface/dialogues/dialogue_scripts/dialog_level_3_2.json"
							}

signal end_dialog

var dialog = []
var dialog_id = 0
var is_dialog_active = false

func _ready():
	$Panel.visible = false
	
func play_dialog(dialogue : String) -> void:
	
	var dialogue_path : String = dialogues.get(dialogue)
	
	if dialogue_path != null:
		print("yes")
		if is_dialog_active:
			return
		is_dialog_active = true
		$Panel.visible = true
		dialog = load_dialog(dialogue_path)
		dialog_id = -1
		load_next_dialog()
	
func load_dialog(dialogue_path : String):
	var file = FileAccess.open(dialogue_path, FileAccess.READ)
	var script = JSON.parse_string(file.get_as_text())
	return script
	
func _input(event):
	if not is_dialog_active:
		return
	if event.is_action_pressed("ui_accept"):
		chat_sound.play()
		load_next_dialog()
	
func load_next_dialog():
	dialog_id += 1
	if dialog_id >= len(dialog):
		is_dialog_active = false
		$Panel.visible = false
		emit_signal("end_dialog")
		return
	
	display_name.text = dialog[dialog_id]["name"]
	display_text.text = dialog[dialog_id]["text"]
