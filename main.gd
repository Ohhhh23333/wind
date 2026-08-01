extends Node2D

@onready var spike: Area2D = $Spike
@onready var wind: Area2D = $Wind
@onready var main_character: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spike.spike_hit.connect(_get_hit)
	wind.player_in_wind.connect(_in_wind_player)
	wind.item_in_wind.connect(_in_wind_item)

func _get_hit():
	main_character.position = Vector2(30, 310) #被刺回出生点

func _in_wind_player():
	main_character.velocity.x += 100 #风吹动玩家

func _in_wind_item():
	pass #风吹动物体



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
