class_name UserInterface
extends CanvasLayer

@export var collectable_counter : Label = null

func _ready():
	Signals.connect("update_collectable_counter", on_update_collectable_counter)
	collectable_counter.text = str(0)

func on_update_collectable_counter(value : int) -> void:
	collectable_counter.text = str(value)

func _on_texture_button_pressed():
	GameManager.pause_game()
