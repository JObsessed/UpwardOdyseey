class_name ConnectionHandler
extends Area2D


func _ready():
	connect("area_entered", on_area_entered)
	
func on_area_entered(area : Area2D) -> void:
	if area == null:
		return
		
	if area is BaseItem:
		area.emit_signal("collect_item")
		$AudioStreamPlayer2D_Collectable.play()
		
	if area.is_in_group("Pickup"):
		$AudioStreamPlayer2D_health.play()

