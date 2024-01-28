extends Control

@onready var audio_name = $HBoxContainer/Audio_name as Label
@onready var volume = $HBoxContainer/Volume as Label
@onready var slider = $HBoxContainer/Slider as HSlider

@export_enum("Master", "Music", "SFX") var audiobus_name : String

var index : int = 0
# Master = 0
# Music = 1
# SFX = 2

func _ready():
	slider.value_changed.connect(on_value_changed)
	get_audiobus_name()
	set_audio_name()
	set_slider()
		
func set_audio_name() -> void:
	audio_name.text = str(audiobus_name) + " Vol."
	
func set_volume() -> void:
	volume.text = str(slider.value * 100) + "%"
	
func set_slider() -> void:
	slider.value = db_to_linear(AudioServer.get_bus_volume_db(index))
	set_volume()
	
func get_audiobus_name() -> void:
	index = AudioServer.get_bus_index(audiobus_name)
	
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(index, linear_to_db(value))
	set_volume()
