extends Control

@onready var optionButton = $HBoxContainer/OptionButton as OptionButton

const resolutions : Dictionary = {
	"1152x648" : Vector2(1152,648),
	"1280x720" : Vector2(1280,720),
	"1920x1080": Vector2(1920,1080)
}

func _ready():
	add_resolution_to_dropdown()
	optionButton.item_selected.connect(select_resolution)
	
func add_resolution_to_dropdown() -> void:
	for resolutionString in resolutions:
		optionButton.add_item(resolutionString)
	
func select_resolution(index : int) -> void:
	DisplayServer.window_set_size(resolutions.values()[index])
