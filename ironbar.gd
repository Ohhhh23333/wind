extends RigidBody2D

var active_wind: Array[Area2D] = []


@onready var is_in_wind := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func on_item_in_wind(body: Node, wind_area: Area2D) -> void:
	if body == self:
		is_in_wind = true
		active_wind.append(wind_area)

func on_item_out_wind(body: Node, wind_area: Area2D) -> void:
	if body == self:
		is_in_wind = false
		active_wind.erase(wind_area)

var flag = 0
func set_ice() -> void:
	flag += 1
	physics_material_override.set_friction(0)
	print("flag: ", flag)
	print(physics_material_override.get_friction())
	print("item on ice")
func clear_ice() -> void:
	if flag <= 1:	
		flag = 0
		print("off ice")
	else:
		flag -= 1
		print("still on ice")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for wind_area in active_wind:		
		if is_in_wind:
			var wind_force = wind_area.wind_force
			var wind_direction = wind_area.wind_direction
			apply_central_force(wind_direction * wind_force * delta*20)
	
	if flag == 0 and not is_equal_approx(physics_material_override.get_friction(), 0.1):
		physics_material_override.set_friction(0.1)
		print(physics_material_override.get_friction())



