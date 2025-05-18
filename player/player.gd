class_name Player
extends CharacterBody2D

@export var speed: float = 250.0

func _enter_tree() -> void:
	set_multiplayer_authority(int(str(name)))

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority():
		return
	
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * speed
	move_and_slide()
	
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
