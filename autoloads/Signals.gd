extends Node

#Signal für Items, die eingesammelt werden können
signal collect_item(collectable_item : BaseCollectableResource)

func emit_collect_item(collectable_item : BaseCollectableResource) -> void:
	collect_item.emit(collectable_item)
	
#Signale für den Zähler der eingesammelten Items
signal on_item_collected(value : int)
signal update_collectable_counter(value : int)

func emit_on_item_collected(value : int) -> void:
	on_item_collected.emit(value)

func emit_update_collectable_counter(value : int) -> void:
	update_collectable_counter.emit(value)

