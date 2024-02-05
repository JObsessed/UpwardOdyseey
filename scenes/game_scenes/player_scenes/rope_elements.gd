extends Sprite2D

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			interpolate(150, 0.2)

func interpolate(length, duration = 0.2) -> void:
	var offset = get_tree().create_tween()
	var height = get_tree().create_tween()

	offset.tween_property(self, "offset", Vector2(0,length/2.0), duration)
	height.tween_property(self, "region_rect", Rect2(0,0,16, length), duration)
	
