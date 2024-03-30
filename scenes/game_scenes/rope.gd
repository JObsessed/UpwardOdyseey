extends Node2D

@onready var rope_elements = $rope_elements
@export var bolt_speed = 20

#Initilaisiere Richtung
var hook_dir = Vector2(0,0)
var bolt_pos = Vector2(0,0)

var is_flying = false
var is_hooked = false

func _process(_delta: float) -> void:
	self.visible = is_flying or is_hooked
	if not self.visible:
		return
	var bolt_loc = to_local(bolt_pos)
	rope_elements.rotation = self.position.angle_to_point(bolt_loc) - deg_to_rad(90) - deg_to_rad(180)
	$bolt.rotation = self.position.angle_to_point(bolt_loc) - deg_to_rad(90) - deg_to_rad(180)
	rope_elements.position = bolt_loc
	rope_elements.region_rect.size.y = bolt_loc.length()
	
func shoot_grappling_hook(direction):
	hook_dir = direction.normalized()
	is_flying = true
	bolt_pos = self.global_position
	
func release_grappling_hook() -> void:
	is_flying = false
	is_hooked = false
	
func _physics_process(_delta: float) -> void:
	$bolt.global_position = bolt_pos
	if is_flying:
		if $bolt.move_and_collide(hook_dir * bolt_speed):
			is_hooked = true
			is_flying = false
	bolt_pos = $bolt.global_position

func _on_visible_on_screen_notifier_2d_screen_exited():
	release_grappling_hook()

