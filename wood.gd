extends RigidBody2D

var active_winds: Array[Area2D] = []

@onready var is_in_wind := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func on_item_in_wind(body: Node, wind_area: Area2D) -> void:
	if body == self:
		is_in_wind = true
		active_winds.append(wind_area)

func on_item_out_wind(body: Node, wind_area: Area2D) -> void:
	if body == self:
		is_in_wind = false
		active_winds.erase(wind_area)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for wind_area in active_winds:
		if is_in_wind:
			var wind_force = wind_area.wind_force
			var wind_direction = wind_area.wind_direction
			apply_central_force(wind_direction * wind_force * delta*20)
