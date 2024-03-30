extends CharacterBody2D

@export var VELOCITY = Vector2.ZERO
@export var GRAVITY = 1500
@export var SPEED = 200

var direction = Vector2.ZERO

var max_health = 100
var player
var state_machine
var sprite

var is_in_range = false
var is_alive = true

#var is_knoecked_back = false
#var is_shocked = false

func init_nodes():
	player = get_parent().get_node("../PlayerNode").get_node("")

func calc_velocity(direction, velocity, delta):
	var updated_velocity = velocity
	
	if !is_on_floor():
		updated_velocity.y += GRAVITY * delta
	
	if is_on_floor():
		updated_velocity.x = direction.x * SPEED.x
		
	elif direction.x == 0:
		updated_velocity.x = 0
	
	if not is_alive:
		updated_velocity = Vector2.ZERO
		
	return updated_velocity
