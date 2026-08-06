extends State

@export var player: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D


# Called when the state is entered.
func _on_enter() -> void:
		player.velocity.y = player.JUMP_VELOCITY
		#先不用管动画，做的是在空中就播放跳跃动画
		
# Called when the state is exited.
func _on_exit() -> void:
	pass # Replace with function body.

# Called when the state needs to transition to another state.
func _on_transition() -> void:
	if player.is_on_floor():
		if player.direction: 
			emit_signal("transition", "run")
		else:
			emit_signal("transition", "idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass