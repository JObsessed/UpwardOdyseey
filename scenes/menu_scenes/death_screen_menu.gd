extends CanvasLayer

@onready var restart_button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/restart_button as TextureButton
@onready var exit_game_button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/exit_game_button as TextureButton

# Muss noch verbessert werden. Läd aktuell nur ein manuelles Level, aber nicht automatisch das,
# worin der Spieler sich befindet.
# Das mit dem manuellen HealthManager reset ist auch bisschen sloppy.

func _on_restart_button_pressed():
	GameManager.restart_game()
	HealthManager.reset_health()
	queue_free()

func _on_exit_game_button_pressed():
	GameManager.leave_game()
	queue_free()

func _on_restart_button_mouse_entered():
	$AudioStreamPlayer2D.play()
func _on_exit_game_button_mouse_entered():
	$AudioStreamPlayer2D.play()
