extends Area2D


@export var wind_direction: Vector2 = Vector2(0, -1) #风向
@export var wind_force: float = 1500.0 #风力
@export var hole: Area2D 

@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D
@onready var wind_collision: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	hole.item_in_hole.connect(_on_item_in_hole)
	hole.item_out_hole.connect(_on_item_out_hole)
	
	animation_player.play("wind_animation")

func _on_item_in_hole():
	animation_player.visible = false
	wind_collision.set_deferred("disabled", true)
	print("item in hole, wind disabled")
func _on_item_out_hole():
	animation_player.visible = true
	wind_collision.set_deferred("disabled", false)
	print("item out hole, wind enabled")


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.set_wind(wind_direction, wind_force)
	if body.is_in_group("item"):
		body.on_item_in_wind(body,self)

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		body.clear_wind()
	if body.is_in_group("item"):
		body.on_item_out_wind(body,self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#动画
	pass
