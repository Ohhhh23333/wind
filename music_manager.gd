extends Node

@onready var player = $AudioStreamPlayer

func _ready() -> void:
    if not player.playing:
        player.play()

