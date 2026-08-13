extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var wind_velocity: Vector2 = Vector2.ZERO


var SPEED = 1050.0
var MAX_SPEED = 150.0
const JUMP_VELOCITY = -400.0

#风吹
func set_wind(wind_direction: Vector2, force: float) -> void:
	wind_velocity = wind_direction * force
	print("inwind")
func clear_wind() -> void:
	wind_velocity = Vector2.ZERO
	print("outwind")

#滑冰
var flag = 0
func set_ice() -> void:
	SPEED = 630.0
	MAX_SPEED = 300.0
	flag += 1
	print("flag: ", flag)
	print("on ice")
func clear_ice() -> void:
	if flag <= 1:	
		flag = 0
		print("off ice")
	else:
		flag -= 1
		print("still on ice")

@onready var direction := 0.0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y <= 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
	else:
		if flag == 0:
			SPEED = 1050.0
			MAX_SPEED = 150.0
	
	direction = Input.get_axis("a", "d")
	if direction:
		var target_x : float = direction * MAX_SPEED
		velocity.x = move_toward(velocity.x, target_x, SPEED * delta)
		animated_sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/2 * delta)

	velocity += wind_velocity * delta

	move_and_slide()

	#push
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var body := collision.get_collider()
		if body is RigidBody2D:
			body.apply_central_force(collision.get_normal() * -2000)

	#print("velocity: ", velocity)
	#print("wind_velocity: ", wind_velocity)
	#print("SPEED:", SPEED*delta, " MAX_SPEED:", MAX_SPEED)

func _process(_delta: float) -> void:
	pass
