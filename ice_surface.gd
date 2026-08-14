extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") or body.is_in_group("item"):
		body.set_ice()
	

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player") or body.is_in_group("item"):
		body.clear_ice()
	

func _process(_delta: float) -> void:
	pass
