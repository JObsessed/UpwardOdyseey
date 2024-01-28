#Manager für alle den Spieler und UI betreffende Daten (Gesundheit, Items, etc.)
class_name PlayerStatusManager
extends Node

var curr_datapad_count : int = 0
var max_datapad_count : int = 9999

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect("on_item_collected", on_item_collected)

func on_item_collected(value : int) -> void:
	curr_datapad_count += value
	
	if (curr_datapad_count > max_datapad_count):
		curr_datapad_count = max_datapad_count
		
	Signals.emit_update_collectable_counter(curr_datapad_count)
