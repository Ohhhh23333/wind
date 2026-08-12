extends Area2D

@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D
@onready var wind_direction: Vector2 = Vector2(0, -1) #风向
@onready var wind_force: float = 1500.0 #风力

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	animation_player.play("wind_animation")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.set_wind(wind_direction, wind_force)
	if body.is_in_group("item"):
		body.on_item_in_wind(body)

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		body.clear_wind()
	if body.is_in_group("item"):
		body.on_item_out_wind(body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#动画
	pass
