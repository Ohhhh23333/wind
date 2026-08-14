extends Area2D

signal played_in_door
signal played_out_door
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		emit_signal("played_in_door")


func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		emit_signal("played_out_door")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
