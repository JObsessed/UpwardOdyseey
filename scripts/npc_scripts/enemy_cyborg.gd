extends CharacterBody2D

var death_eff = preload("res://scenes/game_scenes/Enemies/effects/enemy_death.tscn")

@export var speed : int = 1500
@export var wait_time : int = 3
@export var base_damage : int = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
const GRAVITY = 1500.0
var direction : Vector2 = Vector2.LEFT

# Variablen ür Patrouille der NPCs:
var num_points : int
var point_pos : Array[Vector2]
var point_curr : Vector2
var point_curr_pos : int
var is_monitoring : bool

@onready var cyborg_timer : Timer = $Timer
@export var patrol_points : Node

# Variablen für Animation der NPCs:
enum State {IDLE, WALK, HIT}
var state : State
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Variablen für Schadensberechnung:
var enemy_is_alive : bool = true
var enemyhealthPoints = 10
var damage = 0
var can_take_dmg = true

func _ready():
	if patrol_points != null:
		num_points = patrol_points.get_children().size()
		for point in patrol_points.get_children():
			point_pos.append(point.global_position)
		point_curr = point_pos[point_curr_pos]
	else:
		print("No patrol points")
	
	cyborg_timer.wait_time = wait_time
	state = State.IDLE

func _physics_process(delta):
	
	enemy_gravity(delta)
	enemy_idle(delta)
	enemy_patrol(delta)
	update_healthbar()
	
	move_and_slide()
	animation()
	
func enemy_idle(delta: float) -> void:
	if is_monitoring:
		velocity.x = move_toward(velocity.x, 0, speed * delta)
		state = State.IDLE
				
func enemy_patrol(delta: float) -> void:
	if is_monitoring:
		return
		
	if abs(position.x - point_curr.x) > 0.5:
		velocity.x = direction.x * speed * delta
		state = State.WALK
	else:
		point_curr_pos += 1
		
		if point_curr_pos >= num_points:
			point_curr_pos = 0
			
		point_curr = point_pos[point_curr_pos]
		
		if point_curr.x > position.x:
			direction = Vector2.RIGHT
		else:
			direction = Vector2.LEFT
		
		is_monitoring = true
		cyborg_timer.start()
	
	animated_sprite.flip_h = direction.x < 0
	
func enemy_gravity(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

func _on_timer_timeout() -> void:
	is_monitoring = false

func animation() -> void:
	if state == State.IDLE && is_monitoring:
		animated_sprite.play("idle")
	elif state == State.WALK && not is_monitoring:
		animated_sprite.play("walk")
	elif (state == State.HIT && is_monitoring) or (state == State.HIT && not is_monitoring):
		animated_sprite.play("hit")
		
func take_damage() -> void:
	if can_take_dmg:
		if enemyhealthPoints > 0:
			enemyhealthPoints -= damage
			if enemyhealthPoints <= 0:
				enemy_is_alive = false
				if not enemy_is_alive:
					var death_instance = death_eff.instantiate() as Node2D
					death_instance.global_position = global_position
					get_parent().add_child(death_instance)
					queue_free()
					print("enemy is dead")
			elif enemyhealthPoints > 0:
				print(enemyhealthPoints)
				
func update_healthbar() -> void:
	var healthbar = $healthbar
	healthbar.value = enemyhealthPoints
	healthbar.visible = true
	
func _on_area_2d_area_entered(area):
	print("Projectile has hit enemy")
	damage = 3 
	take_damage()
