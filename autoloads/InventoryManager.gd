extends Node

var inventory : Dictionary

func add_item(type: String, value : String):
	inventory[type] = value
	
func check_for_item(value : String):
	if value == null:
		return false
	
	var item = inventory.find_key(value)
	
	if item:
		return true
	return false
