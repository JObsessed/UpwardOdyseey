extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 300
var base_damage = 1

func _physics_process(delta):
	position += direction * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
