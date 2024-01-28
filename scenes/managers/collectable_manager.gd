class_name CollectableManager
extends Node


func _ready():
	Signals.connect("collect_item", on_item_collected)
	
func on_item_collected(collectable_item : BaseCollectableResource) -> void:
	match collectable_item.collectable_type:
		"":
			print("No Type")
			return
		"datapad":
			Signals.emit_on_item_collected(collectable_item.value)
			print(collectable_item.value)
