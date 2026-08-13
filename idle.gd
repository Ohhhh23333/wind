extends State

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

# Called when the state is entered.
func _on_enter() -> void:
		if player.is_on_floor():
			animated_sprite_2d.play("idle")

# Called when the state is exited.
func _on_exit() -> void:
	pass


# Called when the state needs to transition to another state.
func _on_transition() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if player.is_on_floor():
			emit_signal("transition", "jump")
	elif player.direction and player.is_on_floor():
		emit_signal("transition", "run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	if animated_sprite_2d.get_animation() != "idle" and player.is_on_floor():
		animated_sprite_2d.play("idle")
