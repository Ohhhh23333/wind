extends Node2D

@onready var player: CharacterBody2D = $CharacterBody2D
@onready var door: Area2D = $Area2D 

var is_player_in_door: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door.played_in_door.connect(_on_played_in_door)
	door.played_out_door.connect(_on_played_out_door)

func _on_played_in_door():
	is_player_in_door = true
	print("player in door")
func _on_played_out_door():
	is_player_in_door = false
	print("player out door")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
