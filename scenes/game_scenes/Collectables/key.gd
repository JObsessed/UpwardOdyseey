extends Node2D

@export var key_id : String

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		InventoryManager.add_item("Key1", key_id)
		print("Key " + str(key_id) + " added" )
		queue_free()
