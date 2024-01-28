class_name BaseItem
extends Area2D

@export var collectable_item_resource : BaseCollectableResource = null

@onready var sprite_2d = $Sprite2D as Sprite2D
@onready var animation_player = $AnimationPlayer as AnimationPlayer

signal collect_item

func _ready():
	connect("collect_item", on_collect_item)
	sprite_2d.texture = collectable_item_resource.collectable_texture
	animation()
	
func on_collect_item() -> void:
	print("Collected")
	Signals.emit_collect_item(collectable_item_resource)
	queue_free()

func animation() -> void:
	match collectable_item_resource.collectable_type:
		"":
			return
		"datapad":
			if collectable_item_resource.value == 1:
				animation_player.play("datapad 1")
