extends Area2D

signal player_on_ice
signal player_off_ice
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_on_ice.emit()

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_off_ice.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
