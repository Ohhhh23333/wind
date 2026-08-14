extends Area2D

signal item_in_hole
signal item_out_hole
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("item"):
		emit_signal("item_in_hole")

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("item"):
		emit_signal("item_out_hole")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
