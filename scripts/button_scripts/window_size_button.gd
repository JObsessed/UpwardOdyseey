extends Control

@onready var optionButton = $HBoxContainer/OptionButton as OptionButton

const windowSizes : Array[String] = [
	"Vollbild", 			#0
	"Fenster",				#1
	"Fenster (rahmenlos)",	#2
	"Vollbild (rahmenlos)" 	#3
]
func _ready():
	add_sizes_to_dropdown()
	optionButton.item_selected.connect(select_window_size)
	
func add_sizes_to_dropdown() -> void:
	for windowSize in windowSizes:
		optionButton.add_item(windowSize)
	
func select_window_size(index : int) -> void:
	match index:
		0: #Vollbild
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Fenster
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Fenster ohne Rahmen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Vollbild ohne Rahmen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
