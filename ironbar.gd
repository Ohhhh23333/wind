extends RigidBody2D

@export var wind_area: Area2D

@onready var is_in_wind := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func on_item_in_wind(body: Node) -> void:
	if body == self:
		is_in_wind = true

func on_item_out_wind(body: Node) -> void:
	if body == self:
		is_in_wind = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_in_wind:
		var wind_force = wind_area.wind_force
		var wind_direction = wind_area.wind_direction
		apply_central_force(wind_direction * wind_force * delta*20)
