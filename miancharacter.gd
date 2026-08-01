extends CharacterBody2D

@onready var animated_sprite: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var wind_velocity: Vector2 = Vector2.ZERO


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

#风吹
func set_wind(direction: Vector2, force: float) -> void:
	wind_velocity = direction * force
	print("inwind")
func clear_wind() -> void:
	wind_velocity = Vector2.ZERO


	print("outwind")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		animated_sprite.play("stand")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity += wind_velocity * delta

	move_and_slide()

	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var body := collision.get_collider()
		if body is RigidBody2D:
			body.apply_central_force(collision.get_normal() * -1000)
